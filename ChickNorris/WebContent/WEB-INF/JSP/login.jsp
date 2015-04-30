<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form role="form" action="Login.htm" method="post" >
<div class="form-group">
    				<label for="form_name">Naam (*) :</label>
    				<input type="text" class="form-control" name="username" id="form_name" placeholder="Vul je naam in.">
  				</div>
  				<div class="form-group">
    				<label for="form_firstname">Paswoord:</label>
    				<input type="text" class="form-control" name="password"  id="form_firstname" placeholder="Vul je paswoord in.">
  				</div>
  				<button type="submit" class="btn btn-default">Submit</button>
  				
  				<h1>${error}</h1>
</form>

</body>
</html>