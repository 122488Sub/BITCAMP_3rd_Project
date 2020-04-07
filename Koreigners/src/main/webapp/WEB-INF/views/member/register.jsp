<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입</title>


<style>
	.center {
		float: none;
		margin: 0 auto;
	}
	
	.signIn {
		width: 100%;
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
	<div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2 id="notice">Welcome to KOREIGNERS!</h2>
                </div>
            </div>
        </div>
    </div>
	
	<form class="form" id="regiForm" action="join.do" method="post">
	<div class="cart-box-main">
		<div class="container">
			<div class="col-xs-12 col-sm-12 col-md-10 col-lg-4 center" style="text-align:center">
				<div class="mb-3">
					<div class="title-left">
	                    <h1 style="font-size:2em; font-weight:700">Create Account</h1>
	                </div>
				</div>
				<div class="mb-5">
					<div class="col-md-10 mb-3 center text-left">
						<label>Nickname</label>
						<input type="text" id="mem_name" name="mem_name" class="form-control mb-2" placeholder="nickname">
						<div id="getMemberNick"></div>
					</div>
					<div class="col-md-10 mb-3 center text-left">
						<label>Email(ID)</label>
						<input type="email" id="mem_id" name="mem_id" class="form-control mb-2" placeholder="email address">
						<div id="getMemberEmail"></div>
					</div>
					<div class="col-md-10 mb-3 center text-left">
						<label>Password</label>
						<input type="password" id="mem_pw" name="mem_pw" class="form-control mb-2" placeholder="At least 6 characters">
						<div id="password_check"></div>
					</div>						
				</div>
				<div class="mb-3">
					<input type="submit" class="signIn" value="Create Account">
					<input type="hidden" name="mem_cate" value="p">
				</div>			
				<hr>
				<div class="center">
					<p class="font-weight-bold">Are you an Employer?</p>
					<a class="font-weight-bold" style="color:firebrick; font-size:1.2em" href="job_join.do"><u>Click here!</u></a>
				</div>
			</div>
		</div>
	</div>
	</form>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/member/register.js"></script>
</body>
</html>