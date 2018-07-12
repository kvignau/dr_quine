#include <stdio.h>

#define STR "#include <stdio.h>%1$c%1$c#define STR %2$c%3$s%2$c%1$c#define WRITE_FILE(file) fprintf(file, STR, 10, 34, STR)%1$c#define NO_MAIN() int main(void){FILE	*file = fopen(%2$cGrace_kid.c%2$c, %2$cwb%2$c); /*com1*/if (!file){printf(%2$cOpen file failure%2$c); return (1);} if (WRITE_FILE(file) < 0){printf(%2$cWrite file failure%2$c); return(1);} fclose(file); return(0);}%1$c%1$cNO_MAIN()%1$c"
#define WRITE_FILE(file) fprintf(file, STR, 10, 34, STR)
#define NO_MAIN() int main(void){FILE	*file = fopen("Grace_kid.c", "wb"); /*com1*/if (!file){printf("Open file failure"); return (1);} if (WRITE_FILE(file) < 0){printf("Write file failure"); return(1);} fclose(file); return(0);}

NO_MAIN()
