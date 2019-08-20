<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>여행 코스 수정</title>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

   	<link rel="stylesheet" href="<c:url value='/resources/style.css?after' />">

	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
  <style>
	input, textarea {
		padding: 5px;
		border-radius: 5px;
		border-style: solid;
		border-color: darkgray;
		width: 100%;
	}
	
	a {
		text-decoration: none;
	}
	
	a:hover {
		text-decoration: none;
	}
	</style>

</head>
<body>
<div class="jumbotron text-center">
  <h2>여행 코스 수정</h2>
  <p>여행 코스 정보를 수정합니다</p> 
</div>

<div class="container">
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-body">
			
			<div style="margin-bottom: 50px;">
				<a href="/course/list">
				<button type="button" class="btn btn-primary btn-md">목록으로</button>
				목록으로
				</a>
			</div>
			
			<form action="/courses/modify" method="post">
			
				<input type="hidden" name="courseIdx" value="${course.courseIdx}">
			
				<div class="form-group">
					<label>
						여행코스 이름
						<input name="title" value="${course.title}">
					</label>
				</div>
				<div class="form-group">
				<label>
					여행 종류
					<select name="kind">
						<option value="당일 버스">당일 버스여행</option>
						<option value="숙박 버스">숙박 버스여행</option>
						<option value="당일 기차">당일 기차여행</option>
						<option value="숙박 기차">숙박 기차여행</option>
						<option value="제주도">제주도</option>
						<option value="울릉도·독도">울릉도·독도</option>
						<option value="홍도·흑산도">홍도·흑산도</option>
						<option value="백령도·대청도">백령도·대청도</option>
					</select>
				</label>
				</div>
				<div class="form-group">
				<label>
					출발지
					<input type="text" name="startPlace" class="form-control" value="${course.startPlace}">
				</label>
				</div>
				<div class="form-group">
				<label>
					교통수단
					<select name="traffic">
						<option value="버스">버스</option>
						<option value="항공">항공</option>
						<option value="열차">열차</option>
					</select>
				</label>
				</div>
				<div class="form-group">
				<label>
					여행기간
					<input type="text" name="travelTerm" class="form-control" value="${course.travelTerm}">
				</label>
				</div>
				<div class="form-group">
			   <script src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>
                <label>
           			상세 일정
                	<textarea name="tCourse" id="editorCourse"></textarea>
                </label>
                <script>
                    ClassicEditor
                        .create( document.querySelector( '#editorCourse' ) )
                        .catch( error => {
                            console.error( error );
                        } );
                </script>
				</div>
				<div class="form-group">
				<script src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>
                <label>
           			여행지 및 호텔정보
                	<textarea name="tTravelPlace" id="editorTravelPlace">${course.managerCall}</textarea>
                </label>
                <script>
                    ClassicEditor
                        .create( document.querySelector( '#editorTravelPlace' ) )
                        .catch( error => {
                            console.error( error );
                        } );
                </script>
				</div>
				<div class="form-group">
				<script src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>
                <label>
           			환불규정 및 주의사항
                	<textarea name="tWarning" id="editorWarning">${course.managerCall}</textarea>
                </label>
                <script>
                    ClassicEditor
                        .create( document.querySelector( '#editorWarning' ) )
                        .catch( error => {
                            console.error( error );
                        } );
                </script>
				</div>
				<div class="form-group">
				<label>
					위치
					<input type="text" name="latitude" class="form-control" maxlength="10" style="width: 45%" value="${course.latitude}" >
					<input type="text" name="longitude" class="form-control" maxlength="10" style="width: 45%" value="${course.longitude}" >
				</label>
				</div>
				<input type="submit" class="btn btn-success" value="Submit" style="width: 45%">
				<input type="reset" class="btn btn-warning" value="Reset" style="width: 45%">
			</form>
			
			</div>
		</div>
	</div>
</div>
</body>
</html>