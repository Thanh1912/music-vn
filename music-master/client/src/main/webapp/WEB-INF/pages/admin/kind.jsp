<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-sm-12">

    <section class="panel panel-default">
        <header class="panel-heading" style="height: 60px;">
            <div class="pull-right m-t-xs">
                <a href="#modal-form-kind-of" class="btn btn-rounded btn-sm btn-icon btn-success"
                   data-toggle="modal" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="tạo mới"><i class="fa fa-plus"></i></a>
            </div>
        </header>
        <table class="table table-striped m-b-none">
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên thể loại</th>
                <th>Ngày Tạo</th>
                <th>ACTION</th>
            </tr>
            </thead>
            <tbody id="content-artist">
            </tbody>
        </table>
    </section>

</div>



<!-- Modal Kind of Music-->
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
<!-- Modal Kind of Music edit-->
<div class="modal fade" id="modal-form-edit-kind-of">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body wrapper-lg">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <h3 class="m-t-none m-b">Chỉnh sửa thể loại</h3>
                        <form role="form">
                            <div class="form-group">
                                <label>Tên Thể Loại</label>
                                <input type="hidden" id="id-kind-text" class="form-control" placeholder="">
                                <input type="text" id="kind-edit-text" class="form-control" placeholder="">
                            </div>
                            <div class="checkbox m-t-lg">
                                <a id="edit-kind" class="btn btn-sm btn-success pull-right text-uc m-t-n-xs">
                                     Chỉnh sửa</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>



<script>

    function listkind() {
        $.ajax({
            url: "http://localhost:8080/apitest/kind-of-music-all",
            type: "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                console.log(result.listDTo);
                $("#content-artist").html("");
                for (var i = 0; i < result.length; i++) {
                    $("#content-artist").append(
                        getTemplateArtist(result[i])
                    )
                }

            }
        });
    }
    listkind();
    function getTemplateArtist(item) {
        return  "<tr>\n"+
            "                <td>"+item.id+"</td>\n"+
            "                <td>"+item.name+"</td>\n"+
            "                <td>"+new Date(item.createdAt).toLocaleString()+"</td>\n"+
            "                <td class=\"text-left\">\n"+
            "<a  onclick='loadDateItemKind("+item.id+")' href=\"#modal-form-edit-kind-of\" data-toggle=\"modal\" class='btn btn-s-md btn-primary icon-pencil'></a>"+
            " <a onclick='deletekind("+item.id+")' class='btn btn-s-md btn-danger  icon-trash' ></a>"+
            "                </td>\n"+
            "            </tr>";
    }
    //-----------------------------------
    $("#add-kind").click(function () {
        var name = $("#kind-text").val();
        var userID=1;
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
                FAlert("Thêm thể loại thành công","success");
                listkind();
            },
            error: function (err) {
                FAlert("Thêm album error","error")
            }
        });
    });
    //------------------------------
    //-----------------------------------
    $("#edit-kind").click(function () {
        var name = $("#kind-edit-text").val();
        var id =  $("#id-kind-text").val();
        var userID=1;
        var object = {
            id:id,
            name: name,

        }
        console.log(object);
        $.ajax({
            url: "http://localhost:8080/apitest/kind-of-music/"+id,
            type: "put",
            contentType:"application/json; charset=utf-8",
            dataType:"json",
            data: JSON.stringify(object),
            success: function (result) {
                FAlert("Thêm thể loại thành công","success");
                listkind();
            },
            error: function (err) {
                FAlert("Thêm thể loại error","error")
            }
        });
    });
    //------------------------------
    //-----------------------------------
      function deletekind(id) {
          $.ajax({
              url: "http://localhost:8080/apitest/kind-of-music/"+id,
              type: "delete",
              contentType:"application/json; charset=utf-8",
              dataType:"json",
              success: function (result) {
                  FAlert("xoa thể loại thành công","success");
                  listkind();
              },
              error: function (err) {
                  FAlert("xoa thể loại error","error")
              }
          });
      }
    //------------------------------
    function loadDateItemKind(id) {
        $.ajax({
            url: "http://localhost:8080/apitest/kind-of-music/"+id,
            type: "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                console.log(result);
             $("#kind-edit-text").val(result.name);
              $("#id-kind-text").val(result.id)
            }
        });

    }
</script>

