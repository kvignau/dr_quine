(function main(){
	let i = 5;
	if (i <= 0)
		return ;
	ft_print(i);
})()
function ft_print(i){
	const { exec } = require('child_process');
	const fs = require('fs');
	if (fs.existsSync("Sully_" + i + ".js"))
		i--;
	fs.writeFile("Sully_" + i + ".js", "(function main(){\n\tlet i = " + i + ";\n\tif (i <= 0)\n\t\treturn ;\n\tft_print(i);\n})()\n" + ft_print.toString() + "\n", function(err) {
		if (err)
			return console.log(err);
	});
	const name = "Sully_" + i + ".js";
	exec(`node ${name}`);
}
