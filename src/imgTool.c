#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>

#define SECTOR_SIZE    512
#define SECTOR_COUNT   18
#define CYLENDER_COUNT 80 
#define SECTOR 512 

char buf[SECTOR_SIZE] ; 
int main(int argc , char *argv[])
{
	
	if(argc < 3 )
	{
		printf("usage:./a.out inputFile outputFile cylenderNo headNo sectorNo\n");
		
	}
	
	int seek = 0 ; 
	if(argc > 3) {
		int m_header = atoi(argv[3]);
		int cylender = atoi(argv[4]);
		int sector_pos = atoi(argv[5]);
		seek = cylender * 18 * 2 * 512 ;
		seek += m_header * 18 * 512 ;
		seek += (sector_pos-1) * 512 ;
	}
	 
	
	
	int if_fd = open(argv[1] ,O_RDONLY );
	int of = open(argv[2],O_RDWR);
	int seekPos = lseek(of , seek , SEEK_SET);
	printf("seek pos=>%d seekPos=>%d\n", seek , seekPos);
	if(if_fd <= 0){
	    printf("open input file error!\n");
	    _exit(1);
	}
	int total = 0 ; 	
	for(;;){
		int count = read(if_fd, buf , SECTOR_SIZE) ; 
		if(count == 0)
			break ;
		write(of , buf  , count);
		total++ ; 
	}
	
	printf("count %d +bytes=> %d\n" , total  ,total*512);
	close(of);
	close(if_fd);
	return 0 ; 
}
