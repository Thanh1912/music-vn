<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>
   Nghệ sĩ
</title>
<%--<div class="col-md-2" >--%>
<%--<aside class="aside bg-light dk" id="sidebar">--%>
    <%--<section class="vbox animated fadeInUp">--%>
        <%--<section class="scrollable hover">--%>
            <%--<div id="list-kind" class="list-group no-radius no-border no-bg m-t-n-xxs m-b-none auto">--%>
                <%--<a id="load-All-Album" class="list-group-item">--%>
                    <%--All--%>
                <%--</a>--%>
            <%--</div>--%>
        <%--</section>--%>
    <%--</section>--%>
<%--</aside>--%>
<%--</div>--%>

<div class="col-md-12 artist-page" >
    <h3 class="font-thin">Nghệ sĩ</h3>
    <div class="row row-sm" id="list-artist">

    </div>
</div>
<script>

    function listArtist() {
        $.ajax({
            url: "http://localhost:8080/apitest/artist-all",
            type: "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                $("#list-artist").html("");
                for (var i = 0; i < result.length; i++) {
                    $("#list-artist").append(getTemplateArtist(result[i]))
                }

            }
        });
    }
    function listArtistByIdArtist(id) {
        $.ajax({
            url: "http://localhost:8080/apitest/artist-all",
            type: "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                $("#list-artist").html("");
                for (var i = 0; i < result.length; i++) {
                    $("#list-artist").append(getTemplateArtist(result[i]))
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
                    $("#list-kind").append(getTemplateKind(result[i]))
                }

            }
        });
    }

    function getTemplateArtist(item ){
        return "<div class=\"col-xs-6 col-sm-3\">\n" +
            "            <div class=\"item\">\n" +
            "                <div class=\"pos-rlt\">\n" +
            "                    <div class=\"item-overlay opacity r r-2x bg-black\">\n" +
            "                        <div class=\"center text-center m-t-n\">\n" +
            "                            <a href='http://localhost:8082/vn-music/album?artist="+item.id+"'><i class=\"fa fa-play-circle i-2x\"></i></a>\n" +
            "                        </div>\n" +
            "                    </div>\n" +
            "                    <a href='http://localhost:8082/vn-music/album?artist="+item.id+"'><img src=\"http://localhost:8080/resources/music/images/artist/"+item.image+"/\" alt=\"\" class=\"r r-2x img-full artist-img artist-img\"></a>\n" +
            "                </div>\n" +
            "                <div class=\"padder-v\">\n" +
            "                    <a href='http://localhost:8082/vn-music/album?artist="+item.id+"' class=\"text-ellipsis\">"+item.name+"</a>\n" +
            "                    <a  class=\"text-ellipsis text-xs text-muted\"></a>\n" +
            "                </div>\n" +
            "            </div>\n" +
            "        </div>";
    }
    function getTemplateKind(item ){
        return  "<a class='list-group-item' onclick='listArtistByIdArtist("+item.id+")'>"+
       item.name
        +"</a>";
    }
    listArtist();
    listKindOfMusic();


</script>
