<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>
    Trang chủ
</title>
<section class="hbox stretch">
    <section>
        <section class="vbox">
            <section class="scrollable padder-lg w-f-md" id="bjax-target">
                <%--<a href="#" class="pull-right text-muted m-t-lg" data-toggle="class:fa-spin"><i--%>
                        <%--class="icon-refresh i-lg  inline" id="refresh"></i></a>--%>
                <h2 class="font-thin m-b">Nhạc mới nhất <span class="musicbar animate inline m-l-sm"
                                                              style="width:20px;height:20px">
                    <span class="bar1 a1 bg-primary lter"></span>
                    <span class="bar2 a2 bg-info lt"></span>
                    <span class="bar3 a3 bg-success"></span>
                    <span class="bar4 a4 bg-warning dk"></span>
                    <span class="bar5 a5 bg-danger dker"></span>
                  </span></h2>
                <div class="row row-sm" id="list-music-top">
                </div>
                <div class="row">
                    <div class="col-md-7">
                        <h3 class="font-thin">Top album</h3>
                        <div class="row row-sm" id="list-top-album">

                        </div>
                    </div>
                    <div class="col-md-5">
                        <h3 class="font-thin">Top Nghệ sĩ</h3>
                        <div id="list-top-artist" class="list-group bg-white list-group-lg no-bg auto">
                        </div>
                    </div>
                </div>
                </div>
            </section>
        </section>
    </section>
</section>
<a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
<script type="text/javascript">
    function removeSession() {
        sessionStorage.clear();
    }
    removeSession();
    function getTemplateMusicTop(item) {
        return "<div class=\"col-xs-6 col-sm-4 col-md-3 col-lg-2\">\n" +
            "                      <div class=\"item\">\n" +
            "                        <div class=\"pos-rlt\">\n" +
            "                          <div class=\"bottom\">\n" +
            "                            <span class=\"badge bg-info m-l-sm m-b-sm\"></span>\n" +
            "                          </div>\n" +
            "                          <div class=\"item-overlay opacity r r-2x bg-black\">\n" +
            "                            <div class=\"center text-center m-t-n\">\n" +
            "                              <a href='http://localhost:8082/vn-music/song?idSong="+item.id+"'><i class=\"icon-control-play i-2x\"></i></a>\n" +
            "                            </div>\n" +
            "                            <div class=\"bottom padder m-b-sm\">\n" +
//            "                              <a href=\"#\" class=\"pull-right\">\n" +
//            "                                <i class=\"fa fa-heart-o\"></i>\n" +
//            "                              </a>\n" +
//            "                              <a href=\"#\">\n" +
//            "                                <i class=\"fa fa-plus-circle\"></i>\n" +
//            "                              </a>\n" +
            "                            </div>\n" +
            "                          </div>\n" +
            "                          <a href=\"#\"><img src=\"http://localhost:8080/resources/music/images/song/" + item.thumb + "\" alt=\"\" class=\"r r-2x img-full\"></a>\n" +
            "                        </div>\n" +
            "                        <div class=\"padder-v\">\n" +
            "                          <a href='http://localhost:8082/vn-music/song?idSong="+item.id+"' class=\"text-ellipsis\">" + item.name + "</a>\n" +
            "                          <a href=\"#\" class=\"text-ellipsis text-xs text-muted\">" + item.infoByNameAuthor.username + "</a>\n" +
            "                        </div>\n" +
            "                      </div>\n" +
            "                    </div>"
    }

    function getTemplateAlbumTop(item) {
        return "<div class=\"col-xs-6 col-sm-3\">\n" +
            "                                <div class=\"item\">\n" +
            "                                    <div class=\"pos-rlt\">\n" +
            "                                        <div class=\"item-overlay opacity r r-2x bg-black\">\n" +
            "                                            <div class=\"center text-center m-t-n\">\n" +
            "                                                <a href='http://localhost:8082/vn-music/player?albumId=\"+item.id+\"'><i class=\"fa fa-play-circle i-2x\"></i></a>\n" +
            "                                            </div>\n" +
            "                                        </div>\n" +
            "                                        <a href=\"#\"><img src=\"http://localhost:8080/resources/music/images/album/" + item.poster + "\" alt=\"\" class=\"r r-2x img-full\"></a>\n" +
            "                                    </div>\n" +
            "                                    <div class=\"padder-v\">\n" +
            "                                        <a href='http://localhost:8082/vn-music/player?albumId="+item.id+"' class=\"text-ellipsis\">" + item.name + "</a>\n" +
            "                                        <a href=\"#\" class=\"text-ellipsis text-xs text-muted\">" + "" + "</a>\n" +
            "                                    </div>\n" +
            "                                </div>\n" +
            "                            </div>";
    }
    function getTemplateArtistTop(item) {
        return "<a href='http://localhost:8082/vn-music/album?artist="+item.id+"' class=\"list-group-item clearfix\">\n" +
            "        <span class=\"pull-right h2 text-muted m-l\"></span>\n" +
            "        <span class=\"pull-left thumb-sm avatar m-r\">\n" +
            "        <img src=\"http://localhost:8080/resources/music/images/artist/" + item.image + "\" alt=\"...\">\n" +
            "        </span>\n" +
            "        <span class=\"clear\">\n" +
            "        <span>" + item.name + "</span>\n" +
            "    <small class=\"text-muted clear text-ellipsis\">" + item.name + "</small>\n" +
            "    </span>\n" +
            "    </a>"
    }

    function listArtistTop() {
        $.ajax({
            url: "http://localhost:8080/apitest/artist-all",
            type: "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                for (var i = 0; i < result.length; i++) {
                    $("#list-top-artist").append(getTemplateArtistTop(result[i]))
                }

            }
        });
    }

    function listAlbumTop() {
        $.ajax({
            url: "http://localhost:8080/apitest/album-top",
            type: "get",
            dataType: 'json',
            data: {},
            success: function (result) {

                for (var i = 0; i < result.length; i++) {
                    console.log(result[i])
                    $("#list-top-album").append(getTemplateAlbumTop(result[i]))
                }

            }
        });
    }
    function listSongTop() {
     //  console.log(getCookie("info_user")) ;
        $.ajax({
            url: "http://localhost:8080/apitest/music-top",
            type: "get",
            dataType: 'json',
            success: function (result) {
                for (var i = 0; i < result.length; i++) {
                    $("#list-music-top").append(getTemplateMusicTop(result[i]))
                }

            }
        });
    }
    listSongTop();
    listAlbumTop();
    listArtistTop();
</script>

