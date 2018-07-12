#include <stdio.h>

/*
* com1
*/

void	ft_print(char *str)
{
	printf(str, 10, 10, 10, 10, 10, 10, 10, 10, 9, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 34, str, 34, 10, 9, 10, 9, 10, 10);
}

int		main(void)
{
	char	*str;
	/*
	* com2
	*/
	str = "#include <stdio.h>%c%c/*%c* com1%c*/%c%cvoid	ft_print(char *str)%c{%c%cprintf(str, 10, 10, 10, 10, 10, 10, 10, 10, 9, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 9, 34, str, 34, 10, 9, 10, 9, 10, 10);%c}%c%cint		main(void)%c{%c%cchar	*str;%c%c/*%c%c* com2%c%c*/%c%cstr = %c%s%c;%c%cft_print(str);%c%creturn (0);%c}%c";
	ft_print(str);
	return (0);
}
