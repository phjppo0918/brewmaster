/**
 * 
 */

function ck_coin1(obj){
	obj.src="images/coinpage_images/click_coin1.png";
	document.getElementById('coin2').src="images/coinpage_images/coin2.png";
	document.getElementById('coin3').src="images/coinpage_images/coin3.png";
	document.getElementById('coin4').src="images/coinpage_images/coin4.png";
	document.getElementById('fin_coin').value="10000";
	
}
function ck_coin2(obj){
	obj.src="images/coinpage_images/click_coin2.png";
	document.getElementById('coin1').src="images/coinpage_images/coin1.png";
	document.getElementById('coin3').src="images/coinpage_images/coin3.png";
	document.getElementById('coin4').src="images/coinpage_images/coin4.png";
	document.getElementById('fin_coin').value="20000";
}
function ck_coin3(obj){
	obj.src="images/coinpage_images/click_coin3.png";
	document.getElementById('coin1').src="images/coinpage_images/coin1.png";
	document.getElementById('coin2').src="images/coinpage_images/coin2.png";
	document.getElementById('coin4').src="images/coinpage_images/coin4.png";
	document.getElementById('fin_coin').value="50000";
}
function ck_coin4(obj){
	obj.src="images/coinpage_images/click_coin4.png";
	document.getElementById('coin1').src="images/coinpage_images/coin1.png";
	document.getElementById('coin2').src="images/coinpage_images/coin2.png";
	document.getElementById('coin3').src="images/coinpage_images/coin3.png";
	document.getElementById('fin_coin').value="100000";
}

function ck_pay1(obj){
	obj.src="images/coinpage_images/click_cashpay.png";
	document.getElementById('way_phone').src="images/coinpage_images/phone_pay.png";
	document.getElementById('way_card').src="images/coinpage_images/card_pay.png";
	document.getElementById('fin_way').value="cash";
}
function ck_pay2(obj){
	obj.src="images/coinpage_images/click_phonepay.png";
	document.getElementById('way_cash').src="images/coinpage_images/cash_pay.png";
	document.getElementById('way_card').src="images/coinpage_images/card_pay.png";	
	document.getElementById('fin_way').value="phone";
}
function ck_pay3(obj){
	obj.src="images/coinpage_images/click_cardpay.png";
	document.getElementById('way_cash').src="images/coinpage_images/cash_pay.png";
	document.getElementById('way_phone').src="images/coinpage_images/phone_pay.png";
	document.getElementById('fin_way').value="card";

}

function fin_test() {
	var fin_coin = document.getElementById('fin_coin').value;
	var fin_way = document.getElementById('fin_way').value;
	if(fin_coin=="0"){
		alert('금액을 선택해주세요');
		return false;
	}
	
	if(fin_way=="0"){
		alert('충전 방법을 선택해주세요');
		return false;
	}
	
	return true;
}