
function makeEmail(me) {
	var that = document.getElementById( me );
	var text = that.value;
	// if(!text || 0 === text.length) {
		text = faker.internet.email();
		that.value = text;
	// }
}
