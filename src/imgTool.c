#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>

#define SECTOR 512 

char buf[SECTOR] ; 
int main(int argc , char *argv[])
{
	if(argc < 3 )
	{
		printf("usage:./a.out if= of=\n");
	} 
	int if_fd = open(argv[1] ,O_RDONLY );
	//int count = read(if_fd, buf , SECTOR) ; 
	
	int of = open(argv[2],O_RDWR);
	if(if_fd <= 0){
	    printf("open input file error!\n");
	    _exit(1);
	}
	int total = 0 ; 	
	for(;;){
		int count = read(if_fd, buf , SECTOR) ; 
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
