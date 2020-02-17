/**
 * 
 */
window.onload = function(){
	var sYear = 1960;
	var eYear = 2019;
	var sMonth = 1;
	var eMonth = 12;
	var sDay = 1;
	var eDay = 31;
	
	var strYear="";
	var strMonth="";
	var strDay="";
	for(var i=sYear;i<=eYear;i++){
		strYear+=("<option value="+i+">"+i+"</option>");
	}
	for(var i=sMonth;i<=eMonth;i++){
		strMonth+=("<option value="+i+">"+i+"</option>");
	}
	for(var i=sDay;i<=eDay;i++){
		strDay+=("<option value="+i+">"+i+"</option>");
	}
	document.getElementById("year").innerHTML = strYear;
	document.getElementById("month").innerHTML = strMonth;
	document.getElementById("day").innerHTML = strDay;
}
function checkUserId() {
	var id = document.getElementById('u_id').value.trim();
	if(!/^[A-Za-z0-9]{4,15}$/.test(id)){
		//alert("4자 이상 아이디는 영어 대소문자, 숫자 조합만 가능합니다.");
		//document.getElementById('user_id').focus();
		document.getElementById('id_notice').innerHTML = '4자 이상 아이디는 영어 대소문자, 숫자 조합만 가능합니다.';
		
	}else{
		document.getElementById('id_notice').innerHTML = '';
	}
	
}
function join_ck() {
	var id = document.getElementById('u_id').value.trim();
	var password = document.getElementById('u_pw').value.trim();
	var password_check = document.getElementById('u_pw_ck').value.trim();
	var userName = document.getElementById('u_name').value.trim();
	var u_ph1 = document.getElementById('u_ph1').value.trim();
	var u_ph2 = document.getElementById('u_ph2').value.trim();
	var u_ph3 = document.getElementById('u_ph3').value.trim();
	var u_year = document.getElementById('year').value.trim();
	var u_month = document.getElementById('month').value.trim();
	var u_day = document.getElementById('day').value.trim();
	var u_email = document.getElementById('u_email_1').value.trim();
	var u_email_2 = document.getElementById('u_email_2').value.trim();
	var id_notice = document.getElementById('ck_ok_hid').value.trim();
	
	if (id == '') {
		alert("아이디를 입력해주세요.");
		document.getElementById('u_id').focus();
		
		return false;
	}
	

	// 아이디 정규식 검증
	 if (!/^[A-Za-z0-9]{4,15}$/.test(id)) {
		alert("아이디는 영어, 숫자 조합으로 4자 이상 입력해주세요.");
		document.getElementById('u_id').focus();
	
		return false;
	} 
	
	 if (id_notice=='unc') {
			alert("아이디 중복확인을 해주세요!");
			document.getElementById('u_id').focus();
		
			return false;
		} 
	 
	 
	// 비밀번호 검증
	// 비밀번호 빈칸 검증
	// 사용자이름 빈칸 검증
	
			
	if (password == '') {
		alert("비밀번호를 입력해주세요.");
		document.getElementById('u_pw').focus();
		
		return false;
	}
	 if (!/^[A-Za-z0-9]{4,15}$/.test(password)) {
			alert("비밀번호는 영어, 숫자 조합으로 4자 이상 입력해주세요.");
			document.getElementById('u_pw').focus();
			
			return false;
	 }
	
	
	if (password_check == '') {
		alert("비밀번호를 확인해주세요.");
		document.getElementById('u_pw_ck').focus();
		
		return false;
	}
	
	// 비밀번호 일치 여부 확인
	if (password != password_check) {
		alert("비밀번호를 다시 확인해주세요.");
		document.getElementById('u_pw_ck').focus();
		
		return false;
	}
	
	
	if (userName == '') {
		alert("이름은 입력해주세요.");
		document.getElementById('u_name').focus();
		
		return false;
	}
	//전화번호

	if (u_ph1 == '') {
		alert("전화번호를 입력하세요");
		document.getElementById('u_ph1').focus();
		
		return false;
	}
	if (u_ph2 == '') {
		alert("전화번호를 입력하세요");
		document.getElementById('u_ph2').focus();
		
		return false;
	}
	if (u_ph3 == '') {
		alert("전화번호를 입력하세요");
		document.getElementById('u_ph3').focus();
		
		return false;
	}
	//이메일, 도메인

	if (u_email == '') {
		alert("이메일을 입력하세요.");
		document.getElementById('u_email_1').focus();
		
		return false;
	}
	if (u_email_2 == '') {
		alert("도메인을 입력하세요.");
		document.getElementById('u_email_2').focus();
		
		return false;
	}
	
	return true;
}

st=1;
function ck_only_id(){
	var id = document.getElementById('u_id').value.trim();
	//console.log('ID: ['+id+']');
	//아이디 빈칸 검증
	if(id==''){
		alert("아이디는 필수값입니다.");
		document.getElementById('u_id').focus();
		st=0;
		return false;
		
	}
	//아이디 정규식 검증
	if(!/^[A-Za-z0-9]{4,15}$/.test(id)){
		alert("4자 이상 아이디는 영어 대소문자, 숫자 조합만 가능합니다.");
		document.getElementById('u_id').focus();
		st=0;
		return false;
	}
	//길이검증
	if(id.length<3 || id.length>15){
		alert("아이디는 4자 이상, 15자 이내로 입력해주세요");
		document.getElementById('u_id').focus();
		st=0;
		return false;
	
	}			
	//login 되도록 form submit
	console.log('join success');
	st=1;
}
function goPopup(){
	ck_only_id();
	if(st==1){
		cu_id = document.getElementById('u_id').value.trim();
		
		var pop = window.open("ck_pop.jsp?ck_id="+cu_id,"pop","width=550px,height=300px, scrollbars=no, resizable=no"); 
		
	}
}