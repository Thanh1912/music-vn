<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-sm-12">
    <section class="panel panel-default">
        <header class="panel-heading" style="height: 60px;">
            <div class="pull-right m-t-xs">
                <a href='#modal-form-user' data-toggle='modal' ><i class="fa fa-plus"></i></a>
            </div>
        </header>
        <table class="table table-striped m-b-none" >
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên người dùng</th>
                <th>Email</th>
                <th>Hình ảnh</th>
                <th>Quyền</th>
                <th>Ngày Tạo</th>
                <th>ACTION</th>
            </tr>
            </thead>
            <tbody id="content-artist">
            </tbody>
        </table>
    </section>

</div>




<div class="modal fade" id="modal-form-user">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body wrapper-lg">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <h3 class="m-t-none m-b">Tạo mới User</h3>
                        <form role="form">
                            <div class="form-group">
                                <label>Username </label>
                                <input type="text" id="add-username" class="form-control" placeholder="">
                            </div>
                            <div class="form-group">
                                <label>Email </label>
                                <input type="text" id="add-email" class="form-control" placeholder="">
                            </div>
                            <div class="form-group">
                                <label>Password </label>
                                <input type="text" id="add-password" class="form-control" placeholder="">
                            </div>
                            <div class="form-group">
                                <label>Role </label>
                                <input type="text" placeholder="Nhap user,admin" id="add-role" class="form-control" placeholder="">
                                <span id="all-role">
                                </span>
                                <a class="btn btn-primary right" id="remove-all-role">remove-all</a>
                                <a class="btn btn-primary right" id="add-role-new">add</a>
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
                <a id="add" class="btn btn-sm btn-success pull-right text-uc m-t-n-xs">
                    Taọ mới</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>




<div class="modal fade" id="modal-form-user-edit">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body wrapper-lg">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <h3 class="m-t-none m-b">Chinh Sua User</h3>
                        <form role="form">
                            <div class="form-group">
                                <label>Username </label>
                                <input type="text" id="edit-username" class="form-control" placeholder="">
                                <input type="hidden" id="edit-id-user" >
                            </div>
                            <div class="form-group">
                                <label>Email </label>
                                <input type="text" id="edit-email" class="form-control" placeholder="">
                            </div>
                            <div class="form-group">
                                <label>Role </label>
                                <select id="role_add">
                                    <option value="user">user</option>
                                    <option value="admin">admin</option>
                                </select>
                                <a id="add_r" class="btn">
                                  add role
                                </a>
                                <span id="role_edit">

                                </span>

                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Hinh anh</label>
                                <div class="col-sm-10">
                                    <div class="dropfile visible-lg" id="edit-image-artist">
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
                <a id="edit" class="btn btn-sm btn-success pull-right text-uc m-t-n-xs">
                  Chinh Sua</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<script>
    var idEdit=0;
    var listRole=[];
    var listRoleEdit=[];
    function listuser() {
        var token = CheckToken();
        $.ajax({
            url: "http://localhost:8080/root/api/user/?access_token="+token.access_token,
            type: "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                $("#content-artist").html("");
                for (var i = 0; i < result.listDTo.length; i++) {
                    $("#content-artist").append(
                        getTemplateUser(result.listDTo[i])
                    )
                }
            } , error: function (err) {
                if(err.responseJSON.error=="access_denied"){
                    FAlert("Khong dc phep truy cap error","error");
                    window.location.href = "http://localhost:8082/admin/dashboard";
                }
            }
        });
    }
    listuser();
    function getTemplateUser(item) {
        var template = "<tr>\n" +
            "                <td>" + item.id + "</td>\n" +
            "                <td>" + item.username + "</td>\n" +
            "                <td>" + item.email + "</td>\n" +
            "                <td><img style='height: 50px;width: 50px'  src='http://localhost:8080/resources/music/images/user/" + item.image + "'></td>\an";
        template += "<td>";
        for (var i = 0; i < item.roleName.length; i++) {
            template += item.roleName[i] + ",";
        }
        template += "</td>"
        template +=
            "<td>" + new Date(item.createdAt).toLocaleString() + "</td>\n" +
            "<td class=\"text-right\">\n" +
            "<a onclick='edit(" + item.id + ")' href='#modal-form-user-edit' data-toggle='modal'  class='btn btn-s-md btn-primary icon-pencil'></a>" +
            " <a onclick='deleteUser(" + item.id + ")'  class='btn btn-s-md btn-danger  icon-trash'></a>" +
            " </td>\n" +
            " </tr>";

        return template;
    }
    //-----------------------------------------
    $("#add").click(function () {
        var username = $("#add-username").val();
        var img = $("#add-image-artist img").attr("src");
        var password = $("#add-password").val();
        var email = $("#add-email").val();
        var object = {
            username: username,
            image: img,
            email:email,
            image:img,
            password: password ,
            roleName: listRole
        }
        $.ajax({
            url: "http://localhost:8080/apitest/user",
            type: "post",
            contentType:"application/json; charset=utf-8",
            dataType:"json",
            data: JSON.stringify(object),
            success: function (result){
                listuser();
                FAlert("Thêm  thành công","success")
            },
            error: function (err) {
                FAlert("Thêm error","error")
            }
        });
    });
    $("#edit").click(function () {
        var username = $("#edit-username").val();
        var img = $("#edit-image-artist img").attr("src");
        var role = $("#edit-role").val();
        var id=   $("#edit-id-user").val();
        var object = {
            id:id,
            username: username,
            email: $("#edit-email").val(),
            image: img,
            roleName: listRoleEdit
        };
        console.log(object);
        $.ajax({
            url: "http://localhost:8080/apitest/user/"+id,
            type: "put",
            contentType:"application/json; charset=utf-8",
            dataType:"json",
            data: JSON.stringify(object),
            success: function (result){
                listuser();
                FAlert("cap nhat  thành công","success")
            },
            error: function (err) {
                FAlert("cap nhat error","error")
            }
        });
    });
    //-----------------------------------
    $("#remove-all-role").click(function () {
        $("#all-role").html("");
        $("#all-role").removeClass("user");
        $("#all-role").removeClass("admin");
        listRole=[];
      }
    )
    $("#add_r").click(function () {
         var inputSelected =$("#role_add").val();
          if(listRoleEdit.indexOf(inputSelected)==-1){
              listRoleEdit.push(inputSelected);
              $("#role_edit").html("");
              listRoleEdit.forEach(function(element) {
                  var template="<label class=\"label bg-success m-l-xs\">"+element+"</label>"
                  $("#role_edit").append(template);
              });
            }
          }
    )
    $("#add-role-new").click(function () {
        var input=  $("#add-role").val();
        if(input=="user" && !$("#all-role").hasClass("user")){
            $("#all-role").append("<a  class='btn-danger btn btn-default btn-xs'>user</a>")
            $("#all-role").addClass("user");
            listRole.push("user")
        }
           if(input=="admin" && !$("#all-role").hasClass("admin")){
               $("#all-role").append("<a  class='btn-danger btn btn-default btn-xs'>admin</a>")
               $("#all-role").addClass("admin");
               listRole.push("admin")
           }
    });

    function deleteUser(id) {
        $.ajax({
            url: "http://localhost:8080/apitest/user/"+id,
            type: "delete",
            contentType:"application/json; charset=utf-8",
            dataType:"json",
            success: function (result) {
                FAlert("xoa  user thành công","success");
                listuser();
            },
            error: function (err) {
                FAlert("xoa user error","error")
            }
        });
    }
    function edit(id) {
        $.ajax({
            url: "http://localhost:8080/apitest/user/"+id,
            type: "get",
            contentType:"application/json; charset=utf-8",
            dataType:"json",
            success: function (result) {
                $("#edit-id-user").val(result.id)
                $("#edit-email").val(result.email)
                $("#edit-username").val(result.username);
                if(result.roleName!=null){
                    listRoleEdit=result.roleName;
                    listRoleEdit.forEach(function(element) {
                        var template="<label class=\"label bg-success m-l-xs\">"+element+"</label>"
                        $("#role_edit").append(template);
                    });
                }
            },
            error: function (err) {
                FAlert("Load user  error","error");

            }
        });
    }
</script>

