function banner_roll(div_id, banner_width, banner_delay, banner_speed, this_width)
{
	var div_tag = document.getElementById(div_id);
	var a_tag, i;

	this_width ++;
	if(this_width < banner_width) {
		div_tag.style.left = -this_width;
		setTimeout("banner_roll('" + div_id + "', " + banner_width + ", " + banner_delay + ", " + banner_speed + ", " + this_width + ");", banner_speed);
	} else {
		a_tag = div_tag.getElementsByTagName("A");
		div_tag.appendChild(a_tag[0]);
		div_tag.style.top = 0;
		setTimeout("banner_roll('" + div_id + "', " + banner_width + ", " + banner_delay + ", " + banner_speed + ", 0);", banner_delay);
	}
	return true;
}


$(window).load(function(){
	// banner_roll("div태그 id", 배너1개 너비, 딜레이, 1칸이동속도, 0);
	banner_roll("recommendsite_roll", 400, 100, 5, 0);
});


// view 
/* 
 * <div id="recommendsite_roll" style="overflow: hidden; height: 20px; width: 270px; top: 0px;">
 * 
 * </div> 
 * */
	
	
	
	
	
	
	
	
	
