<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-sm-12">
    <section class="panel panel-default">
        <header class="panel-heading" style="height: 60px;">
            <div class="pull-right m-t-xs">
                <a href="#modal-form-artist" class="btn btn-rounded btn-sm btn-icon btn-success"
                   data-toggle="modal" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="tạo mới"><i class="fa fa-plus"></i></a>
            </div>
        </header>
        <table class="table table-striped m-b-none" >
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên nghệ sĩ</th>
                <th>Hình ảnh</th>
                <th>Ngày Tạo</th>
                <th>ACTION</th>
            </tr>
            </thead>
            <tbody id="content-artist">
            </tbody>
        </table>
    </section>

</div>

<!-- Modal artist-->
<div class="modal fade" id="modal-form-artist-edit">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body wrapper-lg">
                <div class="row">
                    <div class="col-sm-12 b-r">
                        <h3 class="m-t-none m-b">Tạo mới Nghệ sĩ</h3>
                        <form role="form">
                            <div class="form-group">
                                <label>Tên Nghệ sĩ</label>
                                <input type="text" id="edit-artist-new" class="form-control" placeholder="Ten">
                                <input type="hidden"
                                       id="id-artist-text"
                                       class="form-control"
                                       placeholder="">
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
                <a id="edit-artist" class="btn btn-sm btn-success pull-right text-uc m-t-n-xs">
                   Chinh sua</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>





<!-- Modal artist-->
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

<script>
   
    function listartist() {
        $.ajax({
            url: "http://localhost:8080/apitest/artist",
            type: "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                $("#content-artist").html("")
                for (var i = 0; i < result.listDTo.length; i++) {
                    $("#content-artist").append(
                        getTemplateArtist(result.listDTo[i])
                    )
                }

            }
        });
    }
    listartist();
    function getTemplateArtist(item) {
       return  "<tr>\n"+
           "                <td>"+item.id+"</td>\n"+
           "                <td>"+item.name+"</td>\n"+
           "                <td><img style='height: 50px;width: 50px'  src='http://localhost:8080/resources/music/images/artist/"+item.image+"'></td>\an"+
           "                <td>"+new Date(item.modifiedAt).toLocaleString()+"</td>\n"+
           "                <td class=\"text-right\">\n"+
           "<a onclick='editArtist("+item.id+")'  href='#modal-form-artist-edit\' data-toggle='modal'  class='btn btn-s-md btn-primary icon-pencil'></a>"+
          " <a onclick='deleteArtist("+item.id+")' class='btn btn-s-md btn-danger  icon-trash'></a>"+
           "                </td>\n"+
           "            </tr>";
    }
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
    $("#edit-artist").click(function () {
        var artist_text = $("#edit-artist-new").val();
        var img=$("#edit-image-artist img").attr("src");
        var object = {
            id:1,
            name: artist_text,
            image:img
        }
        console.log(object);
        $.ajax({
            url: "http://localhost:8080/apitest/artist/"+object.id,
            type: "put",
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
    function editArtist(id) {
        $.ajax({
            url: "http://localhost:8080/apitest/artist/"+id,
            type: "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                $("#edit-artist-new").val(result.name);
                $("#id-artist-text").val(result.id);
            }
        });

    }
    function deleteArtist(id) {
        $.ajax({
            url: "http://localhost:8080/apitest/artist/"+id,
            type: "delete",
            dataType: 'json',
            data: {},
            success: function (result){
                listartist();
                FAlert("Xoa nghệ sĩ thành công","success")
            },
            error: function (err) {
                FAlert("Xoa nghệ sĩ error","error")
            }
        });

    }



</script>

