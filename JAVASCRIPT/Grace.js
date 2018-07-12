(function ft_print(){
	const fs = require('fs');
	fs.writeFile("Grace_kid.js", "(" + ft_print.toString() + ")()\n", function(err) {
		if (err)
			return console.log(err);
	});
	// com 1
})()
