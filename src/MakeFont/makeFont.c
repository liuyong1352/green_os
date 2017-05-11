#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>

#define CSIZE 16 * ( 8 + 2 ) 

struct font{
	char tag[4] ;
	char bs ;
	char xx[2] ;
	char cc[2] ;
	char lf[2] ;
	char text[CSIZE] ;
	char end ; 
};

char *table = "0123456789ABCDEF";
 
int  convert(struct font* pfont , void* buf )
{
	char c1 = pfont->cc[0] ;
	char c2 = pfont->cc[1] ;
	printf("%c%c\n" ,c1 , c2 );
	for( int i = 0 ,j=0 ; i < 16 ; i++ , j++ ) {
		char ch0 = 0, ch1 = 0 ;
		if(pfont->text[j++] == '*') ch0 |= 0x8  ;
		if(pfont->text[j++] == '*') ch0 |= 0x4  ;
		if(pfont->text[j++] == '*') ch0 |= 0x2  ;
		if(pfont->text[j++] == '*') ch0 |= 0x1  ;
		if(pfont->text[j++] == '*') ch1 |= 0x8  ;
		if(pfont->text[j++] == '*') ch1 |= 0x4  ;
		if(pfont->text[j++] == '*') ch1 |= 0x2  ;
		if(pfont->text[j++] == '*') ch1 |= 0x1  ;
	    *(((char*)buf) + i*4 + 0) = table[ch0] ;
		*(((char*)buf) + i*4 + 1) = table[ch1] ;
		*(((char*)buf) + i*4 + 2) = 'H' ;
		*(((char*)buf) + i*4 + 3) = ',' ;
 		
	   //	printf("0x%c%c ", table[ch0] ,table[ch1] );
	}
    //printf("\n");	
}

int main(int argc , char *argv[]){

			
	int ifd = open("font.txt" ,O_RDONLY);
	
	printf("ifd= %d\n",ifd);

	int size = lseek(ifd , 0 , SEEK_END);	
	lseek(ifd , 0 , SEEK_SET);	
    char* buf = (char*)malloc(size) ;
	if(!buf) {
		printf("malloc exception ~");
		exit(1);
	}
    int rsize = read(ifd , buf , size);	
	printf("size = %d   rsize =%d\n" ,size  , rsize);
	char* s = buf; 

	struct font pfont  ;
	int sSize = sizeof(struct font) - 1 ;
	char* temp = buf ; 
		
	pfont.end = '\0'	;
	int count = 0 ;
	char xbuf[16*4] ;  
	int of ; 
	if(!(of =  open("sysFont.inc",O_WRONLY|O_CREAT)) ) {
		printf("open or creat sysFont.inc fail \n" );
		return 1 ; 
	}
	char *tStr = "systemFont:\n" ; 
	write(of , tStr , strlen(tStr));  
	for(;rsize >= sSize   ; rsize = rsize -  sSize - 2 ){
		memset(&pfont , 0 , sizeof(struct font)) ; 
		memcpy(&pfont , temp ,sSize ) ; 
		//printf("%s\n" , pfont.tag);
		temp = temp +  sSize + 2 ;	
		memset(xbuf , 0 ,sizeof(xbuf));
		convert(&pfont, xbuf) ;
		xbuf[16*4 - 1 ] = '\n' ;
		write(of , "db " , 3) ; 
		write(of , xbuf , sizeof(xbuf)) ; 
		
	//	printf("%s\n", xbuf);
		count++ ;
		//if(count == 4) 
		//	break ;
	}
	close(of) ; 
//	printf("%s\n", pbuf);
	close(ifd);
	free(buf);
	buf = NULL ; 
	return 0 ;
}
