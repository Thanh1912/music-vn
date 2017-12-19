<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    .showMessage-success,.showMessage-error{
        display: none;
        position: absolute;
        z-index: 1041;
    }
</style>
<title>
    Thông tin người dùng
</title>
<div class="alert alert-success showMessage-success" >
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <i class="fa fa-ok-sign"></i><strong> done!</strong>
    <p id="message-success"></p>
</div>
<div id="confirm" class="modal hide fade">
    <div class="modal-body">
        Are you sure?
    </div>
    <div class="modal-footer">
        <button type="button" data-dismiss="modal" class="btn btn-primary" id="delete">Delete</button>
        <button type="button" data-dismiss="modal" class="btn">Cancel</button>
    </div>
</div>

<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
         <%--   <div class="modal-header">
                ...
            </div>--%>
            <div class="modal-body center"  >

                <center><h1>Ban co muon xoa album nay hay khong?</h1></center>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <a id="delete-al" class="btn btn-danger btn-ok">Delete</a>
            </div>
        </div>
    </div>
</div>

<div class="alert alert-danger showMessage-error">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <i class="fa fa-ban-circle"></i><p id="message-error"></p>
</div>
<section id="content">
    <section class="vbox">
        <section class="scrollable">
            <section class="hbox stretch">
                <aside class="aside-lg bg-light lter b-r">
                    <section class="vbox">
                        <section class="scrollable">
                            <div class="wrapper">
                                <div class="text-center m-b m-t">
                                    <a href="#" class="thumb-lg">
                                        <img id="image-user" src="/resources/music/images/a0.png" >
                                    </a>
                                    <div>
                                        <div class="h3 m-t-xs m-b-xs" id="name-user">John.Smith</div>
                                        <small class="text-muted" id="email-user">htp1912@gmail.com</small>
                                    </div>
                                </div>
                                <div>

                                </div>
                            </div>
                        </section>
                    </section>
                </aside>
                <aside class="bg-white">
                    <section class="vbox">
                        <header class="header bg-light lt">
                            <ul class="nav nav-tabs nav-white">
                                <li class="active"><a href="#tab-song" data-toggle="tab">Song</a></li>
                                <li class=""><a href="#tab-album" data-toggle="tab">Album</a></li>
                               <li class=""><a href="#tab-profile" data-toggle="tab">Profile</a></li>
                            </ul>
                        </header>
                        <section class="scrollable">
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab-song">
                                    <ul id="list-song-user" class="list-group no-radius m-b-none m-t-n-xxs list-group-lg no-border">

                                    </ul>
                                </div>
                                <div class="tab-pane" id="tab-album">
                                    <div class="text-center wrapper">
                                        <div class="row row-sm" id="list-album-users">

                                        </div>
                                    </div>
                                </div>
                              <div class="tab-pane" id="tab-profile">
                                    <div class="text-center wrapper">
                                        <i class="fa fa-spinner fa fa-spin fa fa-large"></i>
                                        <div class="col-sm-12">
                                            <div data-validate="parsley">
                                                <section class="panel panel-default">

                                                    <div class="panel-body">
                                                        <p class="text-muted" id="message-user"></p>
                                                        <div class="form-group">
                                                            <label>Username</label>
                                                            <input id="set-username" type="text" class="form-control parsley-validated" data-required="true">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Email</label>
                                                            <input id="set-email" type="text" class="form-control parsley-validated" data-type="email" data-required="true">
                                                        </div>
                                                        <div class="form-group pull-in clearfix">
                                                            <div class="col-sm-6">
                                                                <label>Enter password</label>
                                                                <input  type="password" class="form-control parsley-validated" data-required="true" id="set-password">
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <label>Confirm password</label>
                                                                <input type="password" class="form-control parsley-validated" data-equalto="#pwd" data-required="true">
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Hình ảnh đại diện</label>
                                                            <div id="set-image" class="dropfile visible-lg" >
                                                                <small>Hinh anh file here</small>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <footer class="panel-footer text-right bg-light lter">
                                                        <button  id="edit-user" class="btn btn-success btn-s-xs">Submit</button>
                                                    </footer>
                                                </section>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </section>
                </aside>
            </section>
        </section>
    </section>
    <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
</section>



<div class="modal fade" id="modal-form-edit-album">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body wrapper-lg">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <h3 class="m-t-none m-b">Cập nhật Album</h3>
                      <input type="hidden" id="album-id"/>
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
                <a id="edit-album" class="btn btn-sm btn-success pull-right text-uc m-t-n-xs">
                    Cập nhật</a>
            </div>
        </div><!-- /.modal-content -->

    </div><!-- /.modal-dialog -->

</div>

<!-- Modal edit song-->
<div class="modal fade" id="modal-form-edit-song" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-body">
                <div class="">
                    <section class="panel panel-default">
                        <div class="panel-heading font-bold">Chỉnh sửa bài hát</div>
                        <div class="panel-body">
                            <form >
                                <div class="form-group">
                                    <label>Host video Youtube</label>

                                    <input type="hidden" id="id-song-update-youtbe" >
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

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Your URL Image</label>
                                    <input type="text" id="url-youtube" data-type="url" data-required="true"
                                           class="form-control parsley-validated" placeholder="Your url image">
                                    <a class="btn btn-success" id="load-url-youtube">Load</a>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Hình bài hát</label>
                                    <div class="col-sm-10">
                                        <div class="dropfile visible-lg" id="image-song">
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
                <a id="edit-song" class="btn btn-success btn-s-xs"> <i class="icon-music-tone-alt"></i>
                    Cập nhật bài hát</a>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>
<%--<button class='btn btn-danger btn-xs' type="submit" name="remove_levels" value="delete"><span class="fa fa-times"></span> delete</button>--%>

<script>
    var idUser=0;
    $('#confirm-delete').on('show.bs.modal', function(e) {

    });
    var setid=0;
    var setaction=0;
   function SetIddelete(id,action) {
       setid=id;
       setaction=action;
   }
    $('#delete-al').on('click', function() {
       var action= setaction;
        var id=setid;
        if(action==1)//
        deleteAlbum(id);
        if(action==0)
            deleteSong(id);
    });
    var listAlbumsUser=[];
    var listSongsUser=[];



    function FAlert(message, status) {
        if (status == "error") {
            $(".showMessage-error").css("display", "block");
            $("#message-error").html(message);
        } else {
            $(".showMessage-success").css("display", "block");
            $("#message-success").html(message);
        }
    }

    function getTempalteListSongUser(item){
        return "<li class='list-group-item'>"+
            "<a  class='thumb-sm pull-left m-r-sm'>"+
            "<img src='http://localhost:8080/resources/music/images/song/"+item.poster+"'>"+
            "</a>"+
            "<a  class='clear'>"+
            "</a><div class='pull-right'><a  class='clear'>"+
            "</a><a onclick='SetIdSong("+item.id+")'  class='btn btn-xs btn-success btn-rounded'     data-toggle=\"modal\"  href=\"#modal-form-edit-song\"><i class='fa fa-edit'></i> Edit</a>"+
            "<a onclick='SetIddelete("+item.id+","+0+")'  class='btn btn-xs  btn-s-md btn-danger btn-rounded' data-actiondelte='album' data-id=\"54\" data-toggle=\"modal\" data-target=\"#confirm-delete\"> <i class='fa icon-close'></i> Delete</a></div>"+
            " <strong class='block'>"+item.name+"</strong>"+
            "<small>At </small>"+
            "<small>"+new Date(item.createdAt)+"</small>"+
            " </li>";
    }
    function listSongUser() {
        getInfoUserLogined(function (object) {
            $.ajax({
                url: "http://localhost:8080/apitest/music-by-user/"+object.id,
                type: "get",
                dataType: 'json',
                success: function (result) {
                    $("#list-song-user").html("")
                    for (var i = 0; i < result.length; i++) {
                        $("#list-song-user").append(getTempalteListSongUser(result[i]))
                    }

                }
            });
        })

    }

    function SetIdSong(id) {
        $.ajax({
            url: "http://localhost:8080/apitest/music/"+id,
            type: "get",
            dataType: 'json',
            success: function (result) {
                console.log( result);
                $("#id-song-update-youtbe").val(result.id);
                $("#hostIdVideo").val(result.hostMovieId);
                $("#title-youtbe").val(result.name);
                $("#artist").val(result.artistDTO[0].id);
                $("#album").val(result.albumDTO[0].id);
                $("#image-user").attr("src",'http://localhost:8080/resources/music/images/user/'+result.image)

            }
        });
    }
    function getInfoUser() {

        var obj = getInfoUserLogined(function (object) {
            $.ajax({
                url: "http://localhost:8080/apitest/user/"+object.id,
                type: "get",
                dataType: 'json',
                success: function (result) {
                    console.log(result);
                    $("#email-user").html(result.email);
                    $("#name-user").html(result.username)
                    $("#image-user").attr("src",'http://localhost:8080/resources/music/images/user/'+result.image)
                    LoadInfoUser(result);
                }
            });
        });


    }
    function getTemplateAlBum(item) {

        return "<div class='col-xs-6 col-sm-4 col-md-3'>"+
            " <div class='item'>"+
            " <div class='pos-rlt'>"+
            " <div class='item-overlay opacity r r-2x bg-black'>"+
            " <div class='center text-center m-t-n'>"+
            " <a ><i class='fa fa-play-circle i-2x'></i></a>"+
            "</div>"+
            " </div>"+
            " <a ><img src='http://localhost:8080/resources/music/images/album/"+item.poster+"' alt='' class='r r-2x img-full'></a>"+
            " </div>"+
            "  <div class='padder-v'>"+
            " <a  class='text-ellipsis'>"+item.name+"</a>"+
            "</a><a onclick='getItemAlbum("+item.id+")' class='btn btn-xs btn-success btn-rounded'     data-toggle=\"modal\"  href=\"#modal-form-edit-album\"><i class='fa fa-edit'></i> Edit</a>"+
            "<a onclick='SetIddelete("+item.id+","+1+")'  class='btn btn-xs  btn-s-md btn-danger btn-rounded' data-actiondelte='album' data-id=\"54\" data-toggle=\"modal\" data-target=\"#confirm-delete\"> <i class='fa icon-close'></i> Delete</a>"+
            " </div>"+
            "</div>"+
            " </div>";
    }
    function listAlbumUser(callback) {
        getInfoUserLogined(function (object) {
            $.ajax({
                url: "http://localhost:8080/apitest/album-by-user/"+object.id,
                type: "get",
                dataType: 'json',
                success: function (result) {
                    //   console.log(result);
                    callback(result.listDTo);
                    for (var i = 0; i < result.listDTo.length; i++) {
                        $("#list-album-users").append(getTemplateAlBum(result.listDTo[i]))
                    }
                }
            });
        })

    }
    function LoadInfoUser(item) {
        $("#set-username").val(item.username);
        $("#set-email").val(item.email);
    }

    $(document).ready(function () {
        $("#edit-song").click(function () {


            getInfoUserLogined(function (user) {
                var kindOfMusicID = $("#kind-of-music :selected").val();
                var artistID = $("#artist :selected").val();
                var albumID = $("#album :selected").val();
                alert(albumID)
                var hostIdVideo = $("#hostIdVideo").val();
                var titleYoutbe = $("#title-youtbe").val();
                var src =$("#image-song img").attr("src");
                var object = {
                    id:  $("#id-song-update-youtbe").val(),
                    hostMovieId: hostIdVideo,
                    name: titleYoutbe,
                    thumb: src,
                    poster: src,
                    idAlbum: albumID,
                    idArtist: artistID,
                    idKindOfMusic: kindOfMusicID,
                    idUser: user.id,
                }
                 alert(object)
                $.ajax({
                    url: "http://localhost:8080/apitest/music/"+object.id,
                    type: "put",
                    contentType:"application/json; charset=utf-8",
                    dataType:"json",
                    data: JSON.stringify(object),
                    success: function (result) {
                        alert('cap nhat thanh cong')
                        listSongUser();
                    },
                    error: function (err) {
                        alert('Loi')
                    }
                });
            })

        });
        //-----------------------------------------
        $("#edit-user").click(function () {
            var username=$("#set-username").val();
            var email=$("#set-email").val();
            var password = $("#set-password").val();
            var img=$("#set-image img").attr("src");
            var object = {
                "username": username,
                "email": email,
                "password":password,
                "image":img,
            }
            getInfoUserLogined(function (objects) {
                $.ajax({
                    url: "http://localhost:8080/apitest/user/"+objects.id,
                    type: "put",
                    contentType:"application/json; charset=utf-8",
                    dataType:"json",
                    data: JSON.stringify(object),
                    success: function (result){
                        FAlert(" Cap nhat user thành công","success")
                    },
                    error: function (err) {
                        FAlert("  Loi Cap nhat user","error")
                    }
                });
            })

        });
        //-----------------------------------
        $("#add-kind").click(function () {
            var name = $("#kind-text").val();
            getInfoUserLogined(function (user) {
                var userID=user.id;
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
                        alert("Thêm Thể loại Thanh Cong")
                    },
                    error: function (err) {
                        alert("Thêm Thất bại!")
                    }
                });
            });
        });
        //------------------------------
        $("#edit-album").click(function () {
            var kindOfMusicID = $("#album-kind :selected").val();
            var artistID = $("#album-artist :selected").val();
            var name =$("#album-text").val();
            var src =$("#image-album img").attr("src");
            var id_album=$("#album-id").val();
            getInfoUserLogined(function (object) {
                var object = {
                    name: name,
                    thumb: src,
                    poster: src,
                    idArtist: artistID,
                    idKindOfMusic: kindOfMusicID,
                    idUser: object.id
                }
                console.log(object);
                $.ajax({
                    url: "http://localhost:8080/apitest/album/"+id_album,
                    type: "put",
                    contentType:"application/json; charset=utf-8",
                    dataType:"json",
                    data: JSON.stringify(object),
                    success: function (result) {
                        alert("cap nhat  Thanh Cong")
                    },
                    error: function (err) {
                        alert("cap nhat Thất bại!")
                    }
                });
            })


        });
    });
    getInfoUser();
    listSongUser();
   listAlbumUser(function (value) {
       this.listAlbumsUser=value;
   }  );
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
        $.ajax({
            url: "http://localhost:8080/apitest/album-all",
            type: "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                for (var i = 0; i < result.length; i++) {
                    $("#album").append("<option value='" + result[i].id + "'>" + result[i].name + "</option>")
                }
            }
        });
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
    function deleteAlbum(idAlbum) {
        $.ajax({
            url: "http://localhost:8080/apitest/album/"+idAlbum,
            type: "delete",
            dataType: 'json',
            data: {},
            success: function (result) {
                alert("Xoa album thanh cong!")
            }
        });
    }
    function deleteSong(idsong) {
        $.ajax({
            url: "http://localhost:8080/apitest/music/"+idsong,
            type: "delete",
            dataType: 'json',
            success: function (result) {
                Falert("Xoa Song thanh cong!","success")
                listSongUser();
            },
            error:function (e) {
                Falert("Xoa Song that bai!","error")
            }
        });
    }

    function getItemAlbum(id) {
        console.log(this.listAlbumsUser);
        var obj= this.listAlbumsUser.filter(function (el) {
            return el.id==id;
        });
        console.log(obj);
       $("#album-kind").val(obj[0].idKindOfMusic.toString());
       $("#album-artist").val(obj[0].idArtist.toString());
       $("#album-text").val(obj[0].name);
        $("#album-id").val(obj[0].id);
       $("#image-album").html("<img src='http://localhost:8080/resources/music/images/album/"+obj[0].poster+"' />");
    }
    function getItemSong(id) {
        console.log(this.listAlbumsUser);
        var obj= this.listSongsUser.filter(function (el) {
            return el.id==id;
        });
        console.log(obj);
        $("#album-kind").val(obj[0].idKindOfMusic.toString());
        $("#album-artist").val(obj[0].idArtist.toString());
        $("#album-text").val(obj[0].name);
        $("#album-id").val(obj[0].id);
        $("#image-album").html("<img src='http://localhost:8080/resources/music/images/album/"+obj[0].poster+"' />");
    }
    listKindOfMusic();
    listAlbum();
    listartist();

</script>




