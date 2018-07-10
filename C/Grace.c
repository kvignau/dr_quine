#include <stdio.h>
#define no_main main

void	ft_print(char *str)
{
	printf(str, 10, 10, 10, 10, 10, 9, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 34, str, 34, 10, 9, 10, 9, 10, 10);
}

int		no_main(void)
{
	char	*str;
	/*
	* com1
	*/
	str = "#include <stdio.h>%c#define no_main main%c%cvoid	ft_print(char *str)%c{%c%cprintf(str, 10, 10, 10, 10, 10, 9, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 34, str, 34, 10, 9, 10, 9, 10, 10);%c}%c%cint		no_main(void)%c{%c%cchar	*str;%c%c/*%c%c* com1%c%c*/%c%cstr = %c%s%c;%c%cft_print(str);%c%creturn (0);%c}%c";
	ft_print(str);
	return (0);
}
