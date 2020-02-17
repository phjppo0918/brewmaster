/**
 * 
 */
var wb, hb, wn, ev;
var wb_m,hb_m, wn_m;
function init() { // 문서가 완전히 로드되었을 때 호출
	
	wb = document.getElementById("wb");
	wb_m = document.getElementById("wb_m");
	wb.onmouseover = over1; // over()를 onmouseover 리스너로 등록
	wb.onmouseout = out1; // out()를 onmouseout 리스너로 등록
	
	hb = document.getElementById("hb");
	hb_m = document.getElementById("hb_m");
	hb.onmouseover = over2; // over()를 onmouseover 리스너로 등록
	hb.onmouseout = out2; // out()를 onmouseout 리스너로 등록
	
	wn = document.getElementById("wn");
	wn_m = document.getElementById("wn_m");
	wn.onmouseover = over3; // over()를 onmouseover 리스너로 등록
	wn.onmouseout = out3; // out()를 onmouseout 리스너로 등록
	
	ev = document.getElementById("ev");
	ev.onmouseover = over4; // over()를 onmouseover 리스너로 등록
	ev.onmouseout = out4; // out()를 onmouseout 리스너로 등록
}
function over1() {
	wb_m.src="images/head_images/rollover_worldbeer.png";
}
function out1() {
	wb_m.src="images/head_images/worldbeer.png";
}	

function over2() {
	hb_m.src="./images/head_images/rollover_housebeer.png";
}
function out2() {
	hb_m.src="./images/head_images/housebeer.png";
}	

function over3() {
	wn_m.src="header_image/rollover_wine.png";
}
function out3() {
	wn_m.src="header_image/wine.png";
}
function over4() {
	ev.src="header_image/rollover_events.png";
}
function out4() {
	ev.src="header_image/events.png";
}
function overmc(obj){
	var mcid = obj.id;
	var mcclass = obj.className;
	obj.src="header_image/rollover_"+mcid+".png";	
}
function outmc(obj){
	var mcid = obj.id;
	var mcclass = obj.className;
	obj.src="header_image/"+mcclass+"_"+mcid+".png";
}