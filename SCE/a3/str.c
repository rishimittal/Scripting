#include<stdio.h>
#include<string.h>

int main(){
	char str[] = "this ias a simple string";
	char *p;
	p = strstr(str, "ap");
	printf("%s",p);

return 0;
}
