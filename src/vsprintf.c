#include <stdarg.h>
#include <string.h>

#define __va_rounded_size(TYPE)	\
(((sizeof (TYPE) + sizeof (int) - 1 ) / sizeof (int)) * sizeof (int))

#define va_start(AP , LASTARG)	\
(AP = ((char*) &(LASTARG) + __va_rounded_size(LASTARG))) 

#define va_arg(AP , TYPE) 	\
(AP += __va_rounded_size (TYPE) ,	\
*((TYPE *) (AP - __va_rounded_size (TYPE))))

#define va_end(AP) ( AP = (va_list)0)

char* number(char* buf , int i) {
	char* _t = "0123456789ABCDEF" ;
     unsigned int mask = 0x0F ;
     int pos  = 8 ; 
     do {
         buf[--pos] = _t[ i & mask] ;
         i >>= 4 ; 
    }while(pos) ;
	buf = buf + 8 ; 
	return buf ; 
}


int vsprintf(char *buf , const char* fmt , va_list args) {

	char* str = buf ; 
	for(str = buf ; *fmt ; ++fmt ) {
		if(*fmt != '%') {
			*str++ = *fmt ;
			continue ; 
		}
		// process flags
		++fmt ; 

		switch(*fmt) {
		case 'x':
			str = number(str , va_arg(args , int)) ; 
			break ;  
		}		
	
	}
	*str = '\0' ; 
	return  str - buf ; 
}

int sprintf(char *str , const char *fmt , ...) {
	va_list ap ;
	va_start(ap , fmt) ; 
	vsprintf(str , fmt , ap) ;
	va_end(ap);	
} 
