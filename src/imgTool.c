#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>

#define SECTOR_SIZE    512
#define SECTOR_COUNT   18
#define CYLENDER_COUNT 80 
#define SECTOR 512 

void cal(int sectorNum , int* ph , int* pc , int* ps); 
void printArray(void* arr , int arrLen) ;

void printArray(void* arr , int arrLen) {
	for(int i = 0 ; i < arrLen ; i++ ) {
		printf("%c" , *((char*)arr + i ));
	}
}


void die(char* str) {
	fprintf(stderr , "%s\n" , str) ; 
	exit(1) ; 
}

void error(char* str) {
	fprintf(stderr , "%s errno is %d\n" , str, errno) ;
	exit(1) ;  
}

int readFileToMem(char* fileName , void** pbuf) {

	int fd ;  
	if((fd = open(fileName ,O_RDONLY )) == -1 ) {
		fprintf(stderr , "open %s error \n " , fileName) ; 
		error("open file error");
	}
	int fsize = lseek(fd , 0 , SEEK_END) ; 
	lseek(fd , 0 ,SEEK_SET) ;
	void* buf ;
	if(!(buf = malloc(fsize))) {
		die("malloc error!");
	}
	
	int rsize = read(fd , buf  , fsize );		
	close(fd) ; 
	*pbuf = buf ;
	return rsize ; 
}

char buf[SECTOR_SIZE] ;
char floopy[2][80][18][512] = {0} ;


void writeToFloopy(int header , int cylender , int sector,char* buf , int size  ) {
//	printf("header=%d , cylender=%d , sector=%d ,content size =%d\n" ,header , cylender , sector , size  );
	void* dest = memcpy(floopy[header][cylender][sector-1],buf , size) ; 
//	printArray(dest , size);	
}

void readToFloopy(char* fileName) {
	printf("start readToFloopy: ");
	int fd ; 
	if((fd = open(fileName ,O_RDWR|O_CREAT)) == -1 ){
		 fprintf(stderr , "open %s error \n " , fileName) ;
		 error("open file error");
	}
	void* buf ;

    int rsize = readFileToMem(fileName , &buf);
	int sector_num = rsize / 512 + (rsize%512 ? 1 : 0) ; 
	printf("rsize=%d sector_num = %d\n", rsize,sector_num);
	if(!sector_num)
		return ;	
	int h = 0 , c = 0 , s = 0 ;
	int nsize = 512 ;
	for(int i = 1 ; i <= sector_num ; i++ , rsize = rsize - 512){
		cal(i , &h , &c,&s) ;
		if(rsize < 512)
			nsize =  rsize ; 
		writeToFloopy(h ,c ,s ,buf ,nsize  );
	}
	
	free(buf);
}
//sectorNum should start from 1 
void cal(int sectorNum , int* ph , int* pc , int* ps) {
	int nh = (sectorNum - 1) / (80 * 18) ;
	int nc = (sectorNum - 1 - (nh * 18*80 )) / 18  ;
	*ps = sectorNum - (nc * 18) - (nh*18*80)  ; 
	*pc = nc ; 
	*ph = nh ; 
}

void makeFloopy(char* fileName){
	int fd ; 
	if((fd = open(fileName ,O_RDWR|O_CREAT)) == -1 ){
		 fprintf(stderr , "open %s error \n " , fileName) ;
		 error("open file error");
	}
	for(int c = 0 ; c < 80 ; c++ ) {
		for(int h = 0 ; h < 2 ; h++ ) {
			for( int s = 1 ; s <= 18 ;  s++ ) 	{
				write(fd , floopy[h][c][s-1] ,512 ) ;   
			}
		}
	}
	close(fd) ; 
	
}

 
int main(int argc , char *argv[])
{
//	printf("%d\n" , argc);	
	if(argc != 6 ){
		die("Usage:./imgTool inputFile outputFile cylenderNo headNo sectorNo");
	}

	readToFloopy(argv[2]);
	int m_header = atoi(argv[3]) ; 
	int cylender = atoi(argv[4]) ; 
	int sector_pos = atoi(argv[5]);	
	void* pbuf ; 
	int rsize = readFileToMem(argv[1], &pbuf);
	printf("rsize = %d\n", rsize );
	int n = rsize / 512 + (rsize % 512 == 0 ? 0:1)  ; 
	int wsize = 512 ; 
	for(int i = 0 ; i < n ; i++ ) {
		if(i == (n-1)) {
			wsize = rsize ; 
		}
		printf("count=%d\twrite to header=%d cylender=%d sector=%d wsize=%d\n ",i, m_header, cylender,sector_pos,wsize);
		writeToFloopy(m_header,cylender,sector_pos,((char*)pbuf + (i*512)), wsize ) ;
		sector_pos++ ;  
		
		if(sector_pos > 18 ){ 
			sector_pos = 1 ;
			cylender++ ; 
		}
		rsize -= 512 ; 
	}
	//write(1 , pbuf , rsize) ; 	
//	writeToFloopy(m_header , cylender , sector_pos , pbuf, rsize) ; 
//	write(1 , floopy[m_header][cylender][sector_pos] , rsize) ; 
	free(pbuf) ; 
		
	makeFloopy(argv[2]) ; 
	return 0 ; 
}
