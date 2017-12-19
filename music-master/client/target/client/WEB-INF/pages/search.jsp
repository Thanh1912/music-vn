<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet"
        href="<%=request.getContextPath()%>/resources/music/js/chosen/chosen.css"
        type="text/css"/>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/youtubeApiV3/css/style.css">
  <link rel="stylesheet" type="text/css"
        href="<%=request.getContextPath()%>/resources/youtubeApiV3/fancyapps/source/jquery.fancybox.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/youtubeApiV3/js/script.js"></script>
  <script type="text/javascript"
          src="<%=request.getContextPath()%>/resources/youtubeApiV3/fancyapps/source/jquery.fancybox.pack.js"></script>
  <link rel="stylesheet"
        href="<%=request.getContextPath()%>/resources/music/js/jPlayer/jplayer.flat.css"
        type="text/css"/>
  <link rel="stylesheet"
        href="<%=request.getContextPath()%>/resources/music/css/bootstrap.css"
        type="text/css"/>
  <link rel="stylesheet"
        href="<%=request.getContextPath()%>/resources/music/css/animate.css"
        type="text/css"/>
  <link rel="stylesheet"
        href="<%=request.getContextPath()%>/resources/music/css/font-awesome.min.css"
        type="text/css"/>
  <link rel="stylesheet"
        href="<%=request.getContextPath()%>/resources/music/css/simple-line-icons.css"
        type="text/css"/>
  <link rel="stylesheet"
        href="<%=request.getContextPath()%>/resources/music/css/font.css"
        type="text/css"/>
  <link rel="stylesheet"
        href="<%=request.getContextPath()%>/resources/music/css/app.css"
        type="text/css"/>
  <link rel="stylesheet"
        href="<%=request.getContextPath()%>/resources/music/js/chosen/chosen.css"
        type="text/css"/>
  <link rel="stylesheet"
        href="<%=request.getContextPath()%>/resources/music/css/stylecus.css"
        type="text/css"/>
  <script type="text/javascript" src="/resources/Control/login.js"></script>

  <style>
    body {
      font-family: "Open Sans", sans-serif;
      line-height: 1.6em;
      background: url(https://preview.ibb.co/gwLfvG/bg2.jpg) repeat;
      background-size: cover;
      background-attachment: fixed;
      color: #bac3cc;
      font-size: 14px;
    }
    .btn-home{

    }
    .showMessage-success,.showMessage-error{
      display: none;
      position: absolute;
      z-index: 1041;
    }
  </style>
  <title>
    Tìm kiếm bài hát thêm vào album
  </title>
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
<a class="btn-home btn btn-bg btn-primary" href="http://localhost:8082/vn-music"> <i class="fa fa-home" aria-hidden="true" ></i> Home Music-VN</a>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-body">
        <div class="">
          <section class="panel panel-default">
            <div class="panel-heading font-bold">Tạo mới bài hát</div>
            <label>Mô tả</label>
            <textarea rows="8" id="description" style=" min-width: 499px; min-height: 116px;">
              </textarea>
            <div class="panel-body">
              <form >
                <div class="form-group">
                  <label>Host video Youtube</label>
                  <input type="text" id="hostIdVideo" class="form-control" placeholder=" ID Youtube ">
                </div>
                <div class="form-group">
                  <label>Tiêu đề</label>
                  <input type="text" id="title-youtbe" class="form-control" placeholder="Tiêu đề">
                </div>

                <div class="form-group">
                  <label class="col-sm-3 control-label">Nghệ sĩ</label>
                  <div class="col-sm-9">
                    <div class="row">

                      <div class="col-md-9">
                        <select name="account" id="artist" class="form-control m-b">

                        </select>
                      </div>
                      <%--<div class="col-md-3">--%>
                        <%--<a href="#modal-form-artist" class="btn btn-success"--%>
                           <%--data-toggle="modal">Tạo mới</a>--%>
                      <%--</div>--%>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">Album</label>
                  <div class="col-sm-9">
                    <div class="row">

                      <div class="col-md-8">
                        <select name="album" id="album" class="form-control m-b">

                        </select>
                      </div>
                      <div class="col-md-2">
                        <a href="#modal-form-album" class="btn btn-success" data-toggle="modal">Tạo
                          mới</a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">Thể loại</label>
                  <div class="col-sm-9">
                    <div class="row">

                      <div class="col-md-8">
                        <select name="account" id="kind-of-music" class="form-control m-b">

                        </select>
                      </div>
                      <%--<div class="col-md-2">--%>
                        <%--<a href="#modal-form-kind-of" class="btn btn-success"--%>
                           <%--data-toggle="modal">Tạo mới</a>--%>
                      <%--</div>--%>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label>Your URL Image</label>
                  <input type="text" id="url-youtube" data-type="url" data-required="true"
                         class="form-control parsley-validated" placeholder="Your url image">
                  <a class="btn btn-success" onclick="LoadImageYoutube()" id="load-url-youtube">Load</a>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label">Hình bài hát</label>
                  <div class="col-sm-10">
                    <div class="dropfile visible-lg" id="imagePreviewSong">
                      <small>Hinh anh file here</small>
                    </div>
                  </div>
                </div>
              </form>

            </div>
          </section>
        </div>
      </div>
      <div class="modal-footer">
        <a id="add-song" class="btn btn-success btn-s-xs"> <i class="icon-music-tone-alt"></i>
          Thêm bài hát</a>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<div class="modal fade" id="modal-form-kind-of">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body wrapper-lg">
        <div class="row">
          <div class="col-sm-12 b-r">
            <h3 class="m-t-none m-b">Tạo mới thể loại</h3>
            <form role="form">
              <div class="form-group">
                <label>Tên Thể Loại</label>
                <input type="text" id="kind-text" class="form-control" placeholder="">
              </div>
              <div class="checkbox m-t-lg">
                <a id="add-kind" class="btn btn-sm btn-success pull-right text-uc m-t-n-xs">
                  Tạo mới</a>

              </div>
            </form>
          </div>
        </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>


<div class="modal fade" id="modal-form-album">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body wrapper-lg">
        <div class="row">
          <div class="col-sm-12 b-r">
            <h3 class="m-t-none m-b">Tạo mới Album</h3>
            <form >
              <div class="form-group">
                <label>Tên Album</label>
                <input type="text" id="album-text" class="form-control" placeholder="">
              </div>

              <div class="form-group">
                <label class="col-sm-3 control-label">Nghệ sĩ</label>
                <div class="col-sm-9">
                  <div class="row">
                    <div class="col-md-12">
                      <select name="account" id="album-artist" class="form-control m-b">
                      </select>
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label">Thể Loại</label>
                <div class="col-sm-9">
                  <div class="row">
                    <div class="col-md-12">
                      <select name="account" id="album-kind" class="form-control m-b">
                      </select>
                    </div>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label">Hinh anh</label>
                <div class="col-sm-10">
                  <div class="dropfile visible-lg" id="image-album">
                    <small>Hinh anh file here</small>
                  </div>
                </div>
              </div>

            </form>
          </div>
        </div>
      </div>
      <div class="modal-footer" style="background-color: white;">
        <a id="add-album" class="btn btn-sm btn-success pull-right text-uc m-t-n-xs">
          Tạo mới</a>
      </div>
    </div><!-- /.modal-content -->

  </div><!-- /.modal-dialog -->

</div>


<div class="modal fade" id="modal-form-artist">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body wrapper-lg">
        <div class="row">
          <div class="col-sm-12 b-r">
            <h3 class="m-t-none m-b">Tạo mới Nghệ sĩ</h3>
            <form role="form">
              <div class="form-group">
                <label>Tên Nghệ sĩ</label>
                <input type="text" id="artist-text" class="form-control" placeholder="">
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Hinh anh</label>
                <div class="col-sm-10">
                  <div class="dropfile visible-lg" id="image-artist">
                    <small>Hinh anh</small>
                  </div>
                </div>
              </div>
              <div class="checkbox m-t-lg">


              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <a id="add-artist" class="btn btn-sm btn-success pull-right text-uc m-t-n-xs">
          Taọ mới</a>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>

<div id="container">

  <section>
    <form id="search-form" name="search-from" onsubmit="return search()">
      <div class="field-container">
        <input type="text" id="query" class="search-field" placeholder="What can I help you with today?">
        <input type="submit" name="search-btn" id="search-btn" value="">
      </div>
    </form>
    <div class="clearfix"></div>
    <ul id="results"></ul>
    <div id="buttons"></div>
  </section>
</div>

<!-- Bootstrap -->
<script src="<%=request.getContextPath()%>/resources/music/js/bootstrap.js"></script>
<!-- App -->
<script src="<%=request.getContextPath()%>/resources/music/js/app.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/music/js/slimscroll/jquery.slimscroll.min.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/music/js/masonry/tiles.min.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/music/js/masonry/demo.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/music/js/app.plugin.js"></script>
<script type="text/javascript"
        src="<%=request.getContextPath()%>/resources/music/js/jPlayer/jquery.jplayer.min.js"></script>
<script type="text/javascript"
        src="<%=request.getContextPath()%>/resources/music/js/jPlayer/add-on/jplayer.playlist.min.js"></script>
<script type="text/javascript"
        src="<%=request.getContextPath()%>/resources/music/js/jPlayer/demo.js"></script>
<script>
    //CHECK ACCESS PAGE
    getInfoUserLogined(function (object) {

    });
    function listartist() {
        $.ajax({
            url: "http://localhost:8080/apitest/artist-all",
            type: "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                for (var i = 0; i < result.length; i++) {
                    $("#artist").append(
                        "<option value='" + result[i].id + "'>" + result[i].name + "</option>"
                    )
                    $("#album-artist").append(
                        "<option value='" + result[i].id + "'>" + result[i].name + "</option>"
                    )
                }
            }
        });
    }

    function listAlbum() {
        getInfoUserLogined(function (userobj) {
            $.ajax({
                url: "http://localhost:8080/apitest/album-by-user/"+userobj.id,
                type: "get",
                dataType: 'json',
                data: {},
                success: function (result) {
                    for (var i = 0; i < result.listDTo.length; i++) {
                        $("#album").append("<option value='" + result.listDTo[i].id + "'>" + result.listDTo[i].name + "</option>")
                    }
                }
            });

        })

    }

    function listKindOfMusic() {
        $.ajax({
            url: "http://localhost:8080/apitest/kind-of-music-all",
            type: "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                for (var i = 0; i < result.length; i++) {
                    $("#kind-of-music").append("<option value='" + result[i].id + "'>" + result[i].name + "</option>")
                    $("#album-kind").append("<option value='" + result[i].id + "'>" + result[i].name + "</option>")
                }
            }
        });
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
    function  getUserId() {
        var info = JSON.parse(getCookie("infouser"));
        return info.id;
    }
    $(document).ready(function () {
        $("#add-song").click(function () {
            var kindOfMusicID = $("#kind-of-music :selected").val();
            var artistID = $("#artist :selected").val();
            var albumID = $("#album :selected").val();
            var hostIdVideo = $("#hostIdVideo").val();
            var titleYoutbe = $("#title-youtbe").val();
            var src =$("#imagePreviewSong img").attr("src");
            getInfoUserLogined(function (userobj) {

                var object = {
                    hostMovieId: hostIdVideo,
                    name: titleYoutbe,
                    thumb: src,
                    poster: src,
                    idAlbum: albumID,
                    idArtist: artistID,
                    idKindOfMusic: kindOfMusicID,
                    idUser: userobj.id,
                }
                $.ajax({
                    url: "http://localhost:8080/apitest/music",
                    type: "post",
                    contentType:"application/json; charset=utf-8",
                    dataType:"json",
                    data: JSON.stringify(object),
                    success: function (result) {
                        listAlbum();
                        FAlert("Thêm bài hát thành công","success")
                    },
                    error: function (err) {
                        FAlert("Thêm bài hát thành công","error")
                    }
                });
            });

        });
        //-----------------------------------------
        $("#add-artist").click(function () {
            var artist_text = $("#artist-text").val();
            var img=$("#image-artist img").attr("src");
            var object = {
                name: artist_text,
                image:img
            }
            console.log(object);
            $.ajax({
                url: "http://localhost:8080/apitest/artist",
                type: "post",
                contentType:"application/json; charset=utf-8",
                dataType:"json",
                data: JSON.stringify(object),
                success: function (result){
                    listartist();
                    FAlert("Thêm nghệ sĩ thành công","success")
                },
                error: function (err) {
                    FAlert("Thêm nghệ sĩ error","error")
                }
            });
        });
        //-----------------------------------
        $("#add-kind").click(function () {
            var name = $("#kind-text").val();
            var userID=getUserId();
            var object = {
                name: name
            }
            console.log(object);
            $.ajax({
                url: "http://localhost:8080/apitest/kind-of-music",
                type: "post",
                contentType:"application/json; charset=utf-8",
                dataType:"json",
                data: JSON.stringify(object),
                success: function (result) {
                    listKindOfMusic();
                    FAlert("Thêm thể loại thành công","success")
                },
                error: function (err) {
                    FAlert("Thêm album error","error")
                }
            });
        });
      //------------------------------
        $("#add-album").click(function () {
            var kindOfMusicID = $("#album-kind :selected").val();
            var artistID = $("#album-artist :selected").val();
            var name =$("#album-text").val();
            var src =$("#image-album img").attr("src");
            var userID=getUserId();
            getInfoUserLogined(function (objUser) {
                alert(objUser.id)
                var object = {
                    name: name,
                    thumb: src,
                    poster: src,
                    idArtist: artistID,
                    idKindOfMusic: kindOfMusicID,
                    idUser: objUser.id
                }
                console.log(object);
                $.ajax({
                    url: "http://localhost:8080/apitest/album",
                    type: "post",
                    contentType:"application/json; charset=utf-8",
                    dataType:"json",
                    data: JSON.stringify(object),
                    success: function (result) {
                        listAlbum();
                        FAlert("Thêm album thành công","success")
                    },
                    error: function (err) {
                        FAlert("Thêm album error","error")
                    }
                });
            });

        });
    });

    function FAlert(message,status) {
       if(status=="error"){
           $(".showMessage-error").css("display","block");
           $("#message-error").html(message);
       }else{
           $(".showMessage-success").css("display","block");
           $("#message-success").html(message);
       }
    }
    listartist();
    listKindOfMusic();
    listAlbum();
</script>
</body>
</html>