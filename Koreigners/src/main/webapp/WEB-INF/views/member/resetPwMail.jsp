<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
    <link href="resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
<style>
	.center {
		float: none;
		margin: 0 auto;
	}
	
	.signIn {
		width: 50%;
		height: 40px;
		color: white;
		background-color: #0B3B39;
		border: 1px solid #0B3B39;
		border-radius: .25em;
	}
</style>
</head>
<body>
   <br><br><br>
	<!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2></h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
    
    <form action="resetPwMail.do" method="post">
	<div class="cart-box-main">
		<div class="container">
			<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 center" style="text-align:center">
				<div class="mb-3">
					<div class="title-left">
	                    <h1 style="font-size:2em; font-weight:700">Forgot Password?</h1>
	                </div>
	                <div class="col-md-10 center">
		                <h3>Please enter your registered Email to create new password</h3>
	                </div>
				</div>
				<div class="mb-6">
					<div class="col-md-10 center">
						<input type="text" name="email" class="form-control mb-2" placeholder="Email address">			
					</div>
				</div>
				<div class="mb-3">
					<input type="submit" value="send reset instructions" class="signIn">
				</div>			
				<hr>
			</div>
		</div>
	</div>
	</form>
	
</body>
</html>