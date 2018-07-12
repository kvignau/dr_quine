// TO DO : A REFAIRE !!
(function main(){
	let i = 5;
	ft_print(i);
})()
function ft_print(i){
	const fs = require('fs');
	while (i >= 0)
	{
		fs.writeFile("Sully_" + i + ".js", "(function main(){\n\tlet i = " + i + ";\n\tft_print(i);\n})()\n" + ft_print.toString() + "\n", function(err) {
			if (err)
				return console.log(err);
		});
		i--;
	}
}
