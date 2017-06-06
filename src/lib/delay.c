#include <std.h>

int delay(long millis){
	long cont = millis * 1000 ;
	int j ;  
	for(int i = 0 ; i < cont ; i++ ){
		j = (i+1) & 0x0000FFF;  
	}
	return j ;
}
