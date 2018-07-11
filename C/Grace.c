#include <stdio.h>
#include <stdlib.h>

#define STR "#include <stdio.h>%1$c#define no_main main%1$c%1$cvoid	ft_print(char *str)%1$c{%1$cprintf(str, 10, 10, 10, 10, 10, 9, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 34, str, 34, 10, 9, 10, 9, 10, 10);%1$c}%1$c%1$cint		no_main(void)%1$c{%1$cchar	*str;%1$c/*%1$c* com1%1$c*/%1$cstr = %1$c%2$c%3$s%2$c%1$c;%1$cft_print(str);%1$creturn (0);%1$c}%1$c"
#define WRITE_FILE(file) fprintf(file, STR, 10, 34, STR)
#define NO_MAIN() int main(void){FILE	*file = fopen("Grace_kid.c", "ab+"); /*com1*/if (!file){printf("Open file failure"); return (1);} if (WRITE_FILE(file) < 0){printf("Write file failure"); return(1);} fclose(file); return(0);}

NO_MAIN()
// int		ft_print(FILE *file)
// {
// 	return (fprintf(file, STR, 10, 34, STR));
// }

// int		no_main(void)
// {
// 	FILE	*file = fopen("Grace_kid.c", "ab+");
// 	/*
// 	* com1
// 	*/
// 	if (!file)
// 	{
// 		printf("Open file failure");
// 		return (1);
// 	}
// 	if (ft_print(file) < 0)
// 	{
// 		printf("Write file failure");
// 		return (1);
// 	}
// 	fclose(file);
// 	return (0);
// }
