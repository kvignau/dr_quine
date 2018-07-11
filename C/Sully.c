#include <stdio.h>
#include <strings.h>

int main(void)
{
int i;
char *str;
char path[50];

i = 5;
while (i >= 0)
{
str = "#include <stdio.h>%1$c#include <strings.h>%1$c%1$cint main(void)%1$c{%1$cint i;%1$cchar *str;%1$cchar path[50];%1$c%1$ci = %3$d;%1$cwhile (i >= 0)%1$c{%1$cstr = %2$c%4$s%2$c;%1$csprintf(path, %2$cSully_%5$cd.c%2$c, i);%1$cFILE	*file = fopen(path, %2$cwb%2$c);%1$cif (!file)%1$c{%1$cprintf(%2$cOpen file failure%2$c);%1$creturn (1);%1$c} %1$cif (fprintf(file, str, 10, 34, i, str, 37) < 0)%1$c{%1$cprintf(%2$cWrite file failure%2$c);%1$creturn(1);%1$c}%1$cfclose(file);%1$cbzero(path, 50);%1$ci--;%1$c}%1$creturn(0);%1$c}%1$c";
sprintf(path, "Sully_%d.c", i);
FILE	*file = fopen(path, "wb");
if (!file)
{
printf("Open file failure");
return (1);
} 
if (fprintf(file, str, 10, 34, i, str, 37) < 0)
{
printf("Write file failure");
return(1);
}
fclose(file);
bzero(path, 50);
i--;
}
return(0);
}
