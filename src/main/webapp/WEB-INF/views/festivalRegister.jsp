<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>축제 작성</title>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    
    
    <script>
    window.onload = function() { 
		let message = document.getElementById("failMessage");
		message.innerHTML = "";
		
		let today = new Date();
		let dd = today.getDate();
		let mm = today.getMonth()+1; //January is 0!
		let yyyy = today.getFullYear();
		 if(dd<10){
		        dd='0'+dd
		    } 
		    if(mm<10){
		        mm='0'+mm
		    } 

		today = yyyy+'-'+mm+'-'+dd;
		
		document.getElementById("startDay").setAttribute("value", today);
		document.getElementById("endDay").setAttribute("value", today);
		
		document.getElementById("endDay").setAttribute("min", today);
	}
	
	function chk_festival(){
		let frm = document.frm_festival_register;
		let message = document.getElementById("failMessage");
		
		if(!frm.title.value) {
			frm.title.focus();
			message.innerHTML = "축제명을 입력해주세요!";
		} else if(!frm.charge.value) {
			frm.charge.focus();
			message.innerHTML = "이용요금을 입력해주세요!";
		} else if(!frm.host.value) {
			frm.host.focus();
			message.innerHTML = "주최측을 입력해주세요!";
		} else if(!frm.phone.value) {
			frm.phone.focus();
			message.innerHTML = "문의처를 입력해주세요!";
		} else if(!frm.site.value) {
			frm.site.focus();
			message.innerHTML = "축제 공식 사이트를 입력해주세요!";
		} else if(!frm.address.value) {
			frm.address.focus();
			message.innerHTML = "주소를 입력해주세요!";
		} else if(!frm.latitude.value || isNaN(frm.latitude.value)===true) {
			frm.latitude.focus();
			message.innerHTML = "좌표를 입력해주세요!";
		} else if(!frm.longitude.value || isNaN(frm.longitude.value)===true) {
			frm.longitude.focus();
			message.innerHTML = "좌표를 입력해주세요!";
		} else {
			frm.submit();
		}
	}
	
	function change_endDay(){
		document.getElementById("endDay").setAttribute("min", document.getElementById("startDay").value);
		document.getElementById("endDay").value = document.getElementById("startDay").value;
	}
	</script>
</head>
<body>

<header>
  	<jsp:include page="header.jsp" flush="false" />
</header>

<div class="jumbotron text-center" style="margin-top: 5rem;">
  <h2>축제 작성</h2>
  <p>축제 정보를 작성합니다</p> 
</div>

<div class="container">
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-body">
			
			<form action="/festivals/register" method="post" name="frm_festival_register">
				<div class="form-group">
					<label>
						축제 이름
						<input name="title" maxlength="50" class="form-control">
					</label>
				</div>
				
				<div class="form-group">
				<script src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>
                <label>
           			간단한 설명
                	<textarea name="explain" id="editorfestival"></textarea>
                </label>
                <script>
                    ClassicEditor
                        .create( document.querySelector( '#editorfestival' ) )
                        .catch( error => {
                            console.error( error );
                        } );
                </script>
				</div>
				
				<div class="form-group form-inline" class="form-inline">
					<label>
						축제 기간 &nbsp;
						<input onChange="change_endDay()" id="startDay" type="date" name="startDay" class="form-control">
						&nbsp;~&nbsp;
						<input type="date" name="endDay" id="endDay" class="form-control">
					</label>
				</div>
				
				<div class="form-group">
				<label>
					이용요금
					<input type="number" name="charge" step="1000" class="form-control">
				</label>
				</div>
				
				<div class="form-group">
				<label>
					주최
					<input type="text" name="host" class="form-control" maxlength="25">
				</label>
				</div>
				
				<div class="form-group">
				<label>
					문의처
					<input type="text" name="phone" class="form-control" maxlength="15" placeholder="'-' 와 함께 입력해주세요">
				</label>
				</div>
				
				<div class="form-group">
				<label>
					축제 공식 사이트
					<input type="text" name="site" class="form-control" maxlength="50">
				</label>
				</div>
				
				<div class="form-group">
				<label>
					주소
					<input type="text" name="address" class="form-control" maxlength="50">
				</label>
				</div>
				
				<div class="form-group">
				<label>
					위치
					<input type="text" name="latitude" class="form-control" maxlength="10">
					<input type="text" name="longitude" class="form-control" maxlength="10">
				</label>
				</div>
				<div>
					<span id="failMessage" style="color: red;"></span>
				</div>
				<button type="button" onClick="chk_festival()" class="btn btn-success" style="width: 45%">Submit</button>
				<input type="reset" class="btn btn-warning" value="Reset" style="width: 45%">
			</form>
			
			</div>
		</div>
	</div>
</div>
</body>
</html>