function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

//=================Login===============
function login() {
    var user = {
        username: $("#j_username").val(),
        password: $("#j_password").val()
    }
    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/oauth/token?client_id=spkt&client_secret=secret&grant_type=password',
        dataType: 'json',
        data: user,
        "headers": {
            "Authorization": "Basic c3BrdDpzZWNyZXQ=",
            "Content-type": "application/x-www-form-urlencoded; charset=utf-8"
        },
        crossDomain: true,
        success: function (data) {
            setCookie("token_check_OAUTH2", JSON.stringify(data), 1);
            getInfoUserLogined(function (obj) {
                if(obj.rolename=="user"){
                    window.location.href = "http://localhost:8082/vn-music";
                }else{
                    window.location.href = "http://localhost:8082/admin/dashboard";
                }

            });

        },
        error: function (error) {
            console.log(error);
            FAlert(" Đăng nhap Thất bại!", "error")
        }
    });
}



function CheckToken() {
    console.log(getCookie("infouser"))
   if(getCookie("token_check_OAUTH2")==null||getCookie("token_check_OAUTH2")==""){
       window.location.href = "http://localhost:8082/login";
   }
    var token = JSON.parse(getCookie("token_check_OAUTH2"));
    if (token.isEmptyObject || token == null || token == "") {
        alert('token null')
        window.location.href = "http://localhost:8082/login";
    }
    return token;
}

function getInfoUserLogined(callback) {
    var token = CheckToken();
    console.log("CheckToken")
    console.log(token)

    $.ajax({
        url: "http://localhost:8080/api/info-user-logined/?access_token=" + token.access_token,
        type: "get",
        contentType: "application/json; charset=utf-8",
        success: function (result) {
            console.log(result);
            setCookie("infouser", JSON.stringify(result), 1);
            callback(result);
        }
        ,
        error: function (err) {
            console.log(err)
            if (err.responseText == "access_dinied") {
                window.location.href = "http://localhost:8082/access_dinied";
                JSON.parse(err.responseText)
            } else {
                window.location.href = "http://localhost:8082/login";
            }

        }
    });
}

function logout() {
    setCookie("infouser", "", 0);
    setCookie("token_check_OAUTH2", "", 0);
    window.location.href = "http://localhost:8080/logout"
}


$("#login").click(function () {
    login();
});
//=================Login===============
$(document).ready(function () {
    function register() {
        var username = $("#username").val();
        var password = $("#password").val();
        var email = $("#email").val();
        var object = {
            username: username,
            password: password,
            email: email
        };
        $.ajax({
            url: "http://localhost:8080/apitest/register",
            type: "post",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify(object),
            success: function (result) {
                $(".alert").append("<h5 class=\"w3ls-title\"> <i class=\"fa fa-thumbs-o-up w3-text-indigo\"></i> Đăng ký thành công</h5>")
            },
            error: function (err) {
                FAlert(" Đăng Ký Thất bại!", "error")
            }
        });
    }

    //=====================action=====================
    $(document).ready(function () {
        $("#rigister").click(function () {
            register();
        });
    });
});

