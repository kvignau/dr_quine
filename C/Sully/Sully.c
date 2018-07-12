#include <stdio.h>
#include <strings.h>
#include <unistd.h>
#include <stdlib.h>

int main(void)
{
int i;
char *str;
char path[50];
char path2[50];
char command[500];

i = 5;

if (i <= 0)
return(0);
str = "#include <stdio.h>%1$c#include <strings.h>%1$c#include <unistd.h>%1$c#include <stdlib.h>%1$c%1$cint main(void)%1$c{%1$cint i;%1$cchar *str;%1$cchar path[50];%1$cchar path2[50];%1$cchar command[500];%1$c%1$ci = %3$d;%1$c%1$cif (i <= 0)%1$creturn(0);%1$cstr = %2$c%4$s%2$c;%1$csprintf(path, %2$cSully_%%d.c%2$c, i);%1$cif (access(path, F_OK) >= 0)%1$ci--;%1$csprintf(path, %2$cSully_%%d.c%2$c, i);%1$csprintf(path2, %2$cSully_%%d%2$c, i);%1$cFILE	*file = fopen(path, %2$cwb%2$c);%1$cif (!file)%1$c{%1$cprintf(%2$cOpen file failure%2$c);%1$creturn (1);%1$c}%1$cif (fprintf(file, str, 10, 34, i, str, 37) < 0)%1$c{%1$cprintf(%2$cWrite file failure%2$c);%1$creturn(1);%1$c}%1$cfclose(file);%1$csprintf(command, %2$cclang -Wall -Wextra -Werror -o %%s %%s%2$c, path2, path);%1$csystem(command);%1$cbzero(command, 500);%1$csprintf(command, %2$c./%%s%2$c, path2);%1$csystem(command);%1$cbzero(path, 50);%1$cbzero(command, 500);%1$creturn(0);%1$c}%1$c";
sprintf(path, "Sully_%d.c", i);
if (access(path, F_OK) >= 0)
i--;
sprintf(path, "Sully_%d.c", i);
sprintf(path2, "Sully_%d", i);
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
sprintf(command, "clang -Wall -Wextra -Werror -o %s %s", path2, path);
system(command);
bzero(command, 500);
sprintf(command, "./%s", path2);
system(command);
bzero(path, 50);
bzero(command, 500);
return(0);
}
