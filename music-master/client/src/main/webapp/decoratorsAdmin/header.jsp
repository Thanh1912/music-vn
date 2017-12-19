<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header
        class="bg-white-only header header-md navbar navbar-fixed-top-xs">
    <div class="navbar-header aside bg-info nav-xs">
        <a class="btn btn-link visible-xs"
           data-toggle="class:nav-off-screen,open" data-target="#nav,html">
            <i class="icon-list"></i>
        </a> <a href="/admin/dashboard" class="navbar-brand text-lt"> <i
            class="icon-earphones"></i> <img
            src="<%=request.getContextPath()%>/resources/music/images/logo.png"
            alt="." class="hide"> <span class="hidden-nav-xs m-l-sm">Music Admin</span>
    </a> <a class="btn btn-link visible-xs" data-toggle="dropdown"
            data-target=".user"> <i class="icon-settings"></i>
    </a>
    </div>
    <ul class="nav navbar-nav hidden-xs">
        <li><a href="#nav,.navbar-header"
               data-toggle="class:nav-xs,nav-xs" class="text-muted"> <i
                class="fa fa-indent text"></i> <i class="fa fa-dedent text-active"></i>
        </a></li>
    </ul>
    <div class="navbar-right ">
        <ul class="nav navbar-nav m-n hidden-xs nav-user user">

            <li class="dropdown" id="user-info"><a
                                                   class="dropdown-toggle bg clear" data-toggle="dropdown"> <span
                    class="thumb-sm avatar pull-right m-t-n-sm m-b-n-sm m-l-sm">
						<img id="userimage"
                             src=""
                             alt="userImage">
				</span> <span id="username"></span>
                <b class="caret"></b>
            </a>
                <ul class="dropdown-menu animated fadeInRight">
                    <li><a onclick="logout()" >Logout</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</header>
<script>
    //CHECK ACCESS PAGE 
    getInfoUserLogined(function (object) {

    });
    function LoadInfo() {
        var cinfo=getCookie("infouser");
        if(cinfo!==""){
            $("#user-info").css("display","block");
            var info = JSON.parse(cinfo);
            $("#username").html(info.username)
            $("#userimage").attr("src", "http://localhost:8080/resources/music/images/user/" + info.image)
        }
        else {
            $("#user-info").css("display","none");
        }
    }
    LoadInfo();
</script>


