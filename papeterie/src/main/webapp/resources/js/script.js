/**
 * 
 */

function show_sub(idx) {
	for (var i = 0; i < 5; i++) {
		if (i == idx) {
			document.getElementsByClassName("sub")[i].style.visibility = "visible";
		}
		else {
			document.getElementsByClassName("sub")[i].style.visibility = "hidden";
		}
	}
}

function hide_sub(idx) {
	document.getElementsByClassName("sub")[idx].style.visibility = "hidden";
}

