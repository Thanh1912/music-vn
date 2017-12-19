<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Popular Login Form Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login Sign up Responsive web template, Smart phone Compatible web template, free web designs for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!-- Custom Theme files -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="<%=request.getContextPath()%>/resources/login/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- //Custom Theme files -->
<!-- web-font -->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700' rel='stylesheet' type='text/css'>
<!-- //web-font -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/music/css/simple-line-icons.css" type="text/css" />
<!-- pop-up-box -->
<script src="<%=request.getContextPath()%>/resources/login/js/jquery-2.2.3.min.js"></script> 
<script>
    function FAlert(message,status) {
        if(status=="error"){
            $(".showMessage-error").css("display","block");
            $("#message-error").html(message);
        }else{
            $(".showMessage-success").css("display","block");
            $("#message-success").html(message);
        }
    }
	$(document).ready(function() {
		$('.popup-top-anim').magnificPopup({
			type: 'inline',
			fixedContentPos: false,
			fixedBgPos: true,
			overflowY: 'auto',
			closeBtnInside: true,
			preloader: false,
			midClick: true,
			removalDelay: 300,
			mainClass: 'my-mfp-zoom-in'
		});

	}); 
</script>
	<style type="text/css">
		.alert-success {
			background-color: #dff0d8;
			border-color: #d0e9c6;
			color: #3c763d;
		}
		.alert {
			padding: .75rem 1.25rem;
			margin-bottom: 1rem;
			border: 1px solid transparent;
			border-radius: .25rem;
		}
		.alert-dismissable .close, .alert-dismissible .close {
			position: relative;
			top: -2px;
			right: -21px;
			color: inherit;
		}
		a.close {
			text-decoration: none !important;
			font-size: 18px !important;
			line-height: 1.2;
		}
		.close {
			float: right;
			font-size: 21px;
			font-weight: 700;
			line-height: 1;
			color: #000;
			text-shadow: 0 1px 0 #fff;
			filter: alpha(opacity=20);
			opacity: .2;
		}
		.showMessage-success,.showMessage-error {
			display: none;
			position: absolute;
			z-index: 2000;
		}
		.success:hover {
			background-color: #46a049;
		}

		.success {
			background-color: #4CAF50;
		}
		.btn {
			border: none;
			color: white;
			padding: 10px 28px;
			text-align: center;
			display: inline-block;
			font-size: 16px;
			cursor: pointer;
		}
		.fade.in {
			opacity: 1;
		}

		.alert-danger {
			color: #a94442;
			background-color: #f2dede;
			border-color: #ebccd1;
		}

		.alert-dismissable, .alert-dismissible {
			padding-right: 35px;
		}

		.alert {
			padding: 15px;
			margin-bottom: 20px;
			border: 1px solid transparent;
			border-radius: 4px;
		}

		.fade {
			opacity: 0;
			-webkit-transition: opacity .15s linear;
			-o-transition: opacity .15s linear;
			transition: opacity .15s linear;
		}
	</style>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- //pop-up-box -->
</head>
<body>
<div class="alert alert-success showMessage-success" >
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<i class="fa fa-ok-sign"></i><strong> done!</strong>
	<p id="message-success"></p>
</div>
<div class="alert alert-danger showMessage-error">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<i class="fa fa-ban-circle"></i><p id="message-error"></p>
</div>
 <!-- login starts here -->
	<div class="login agile">
		<div class="w3agile-border">
			<h2><a href="/vn-music"><i class="icon-earphones"></i></a>&nbsp Music VN</h2>
			<div class="login-main login-agileits"> 
				<h1>Login</h1> 
				<form  method="get">
					<p>Email</p>
					<input type="text" placeholder="example@gmail.com" name="emailD" id="j_username" required="">
					<p>Password</p>
					<input type="password" placeholder="Password" name="dpassword" id="j_password"  required="">
					<input id="login" type="button" value="Login">
				</form>

				<h3>Not a member yet ? <a href="#small-dialog" class="sign-in popup-top-anim"> Sign Up Now !</a></h3>
			</div>
		</div>
		<!-- modal -->
		<div id="small-dialog" class="mfp-hide">\
			<div class="alert">
			</div>
			<h5 class="w3ls-title">Sign Up</h5>
			<div class="login-modal login"> 
				<div class="w3agile-border">
					<p>Your Name</p>
					<input type="text" id="username" placeholder="Your Name" name="name" required="">
					<p>Email</p>
					<input type="text"  id="email" placeholder="example@gmail.com" name="mail" required="">
					<p>Password</p>
					<input type="password"  id="password" placeholder="Password" name="Password" required="">
					<button  id="rigister" class="btn success"  >
						Đăng Ký
					</button>
				</div>
			</div>
		</div>
		<!-- //modal -->  
	</div>
	<!-- //login ends here -->
	<!-- copyrights -->

<script src="<%=request.getContextPath()%>/resources/login/js/jquery.magnific-popup.js" type="text/javascript"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="/resources/Control/login.js"></script>

</body>
</html>