<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- /.aside -->
<title>
    Album
</title>
    <section class="vbox">
        <section class="w-f-md" id="bjax-target">
            <section class="hbox stretch">
                <!-- side content -->

                <aside class="aside bg-light dk" id="sidebar">
                    <section class="vbox animated fadeInUp">
                        <section class="scrollable hover">
                            <div id="list-kind-of-music" class="list-group no-radius no-border no-bg m-t-n-xxs m-b-none auto">
                                <a id="load-All-Album" href="/vn-music/album?page=0&size=10&kind=0" class="list-group-item">
                                    All
                                </a>
                            </div>
                        </section>
                    </section>
                </aside>
                <!-- / side content -->
                <section>
                    <section class="vbox">
                        <section class="scrollable padder-lg">
                            <h2 class="font-thin m-b">Album</h2>
                            <div class="row row-sm" id="list-Album">

                              </div>
                            <ul id="pageing" class="pagination pagination">

                            </ul>
                        </section>
                    </section>
                </section>
            </section>
        </section>

    </section>
    <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
<script>

    var getUrlParameter = function getUrlParameter(sParam) {
        var sPageURL = decodeURIComponent(window.location.search.substring(1)),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : sParameterName[1];
            }
        }
    };
    var kind=0;
    var artistId=0;
    var pageurl=0;
    var sizeurl=0;
    function init() {
        if(getUrlParameter("kind")!==undefined){
            kind=getUrlParameter("kind")
        }
        if(getUrlParameter("artistId")!==undefined){
            kind=getUrlParameter("artistId")
        }
        if(getUrlParameter("page")!==undefined){
            pageurl=getUrlParameter("page")
        }
        if(getUrlParameter("size")!==undefined){
            sizeurl=getUrlParameter("size")
        }
    }
    init();

    function paging(totalPage, page, size, url) {
        var template = "";
        var pre = "<li><a href='" + url + "'><i class='fa fa-chevron-left'></i></a></li>";
        var active = "<li class='active'><a href='" + url + "?page=1&size="+size + "' class='active-value'>" + page + "</a></li>";
        var next = "<li><a href=''><i class='fa fa-chevron-right'></i></a></li>";
        template += pre;
        for (var i = 1; i <=totalPage; i++) {
            if (page == i)
                template += active;
            else {
                var count = "<li><a href='" + url + "?page=" + i + "&size="+size +"&kind="+kind+ "'>" + i + "</a></li>";
                template += count;
            }
        }
        template += next;
        $("#pageing").html(template)
    }
    function getTemplateListKindOfMusic(item){
        init();
        return " <a href='/vn-music/album?page="+pageurl+"&size="+sizeurl+"&kind="+item.id+"'  class=\"list-group-item \">\n" +
            "        "+item.name+"\n" +
            "        </a>"
    }
    function getTemplateListAlbum(item){
        return "     <div class=\"col-xs-6 col-sm-4 col-md-3 col-lg-2\">\n" +
            "                                    <div class=\"item\">\n" +
            "                                        <div class=\"pos-rlt\">\n" +
            "                                            <div class=\"item-overlay opacity r r-2x bg-black\">\n" +
            "                                                <div class=\"center text-center m-t-n\">\n" +
            "                                                    <a href='http://localhost:8082/vn-music/player?albumId="+item.id+"'><i class=\"fa fa-play-circle i-2x\"></i></a>\n" +
            "                                                </div>\n" +
            "                                            </div>\n" +
            "                                            <a href='http://localhost:8082/vn-music/player?albumId="+item.id+"'><img src=\"http://localhost:8080/resources/music/images/album/"+item.poster+"\" alt=\"\" class=\"r r-2x img-full\"></a>\n" +
            "                                        </div>\n" +
            "                                        <div class=\"padder-v\">\n" +
            "                                            <a href='http://localhost:8082/vn-music/player?albumId="+item.id+"' data-bjax data-target=\"#bjax-target\" data-el=\"#bjax-el\" data-replace=\"true\" class=\"text-ellipsis\">"+item.name+"</a>\n" +
            "                                            <a href='http://localhost:8082/vn-music/player?albumId="+item.id+"' data-bjax data-target=\"#bjax-target\" data-el=\"#bjax-el\" data-replace=\"true\" class=\"text-ellipsis text-xs text-muted\">"+item.user_id+"</a>\n" +
            "                                        </div>\n" +
            "                                    </div>\n" +
            "                                </div>\n" +
            "                            ";
    }

    function listAlbumbyIdKindOfMusic(id) {
        $.ajax({
            url: "http://localhost:8080/apitest/album-by-kind/"+id,
            type:  "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                for (var i=0; i<result.listDTo.length; i++) {
                    $("#list-Album").append(getTemplateListAlbum(result.listDTo[i]));
                }
            }
        });
    }



    function listAlbumAll() {
        $.ajax({
            url: "http://localhost:8080/apitest/album"+"?page="+pageurl+"&size="+sizeurl,
            type:  "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                for (var i=0; i<result.listDTo.length; i++) {
                    $("#list-Album").append(getTemplateListAlbum(result.listDTo[i]));
                }
               var totalpage=Math.round(Number(result.page.totalElement)/10);
                var pageCurrent=Number(result.page.pageCurrent);
                var size=Number(result.page.size);
                paging(totalpage,pageCurrent,size,"http://localhost:8082/vn-music/album");
            }
        });
    }

    function listalbumByArtist(id) {
        init();
        $.ajax({
            url: "http://localhost:8080/apitest/album-by-artist/"+id+"?page="+pageurl+"&size="+sizeurl+"&kind="+kind,
            type:  "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                $("#list-Album").html("");
                for (var i=0; i<result.listDTo.length; i++) {
                    $("#list-Album").append(getTemplateListAlbum(result.listDTo[i]));
                }
                var totalpage=Math.round(Number(result.page.totalElement)/10);
                var pageCurrent=getUrlParameter('page');
                console.log(pageCurrent);
              //  pageCurrent=Number(result.page.pageCurrent);
                var size=Number(result.page.size);
                paging(totalpage,pageCurrent,size,"http://localhost:8082/vn-music/album");
            }
        });
    }

    function listkindOfMusicAll() {
        $.ajax({
            url: "http://localhost:8080/apitest/kind-of-music-all",
            type:  "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                for (var i=0; i<result.length; i++) {
                    $("#list-kind-of-music").append(getTemplateListKindOfMusic(result[i]));

                }
            }
        });
    }
    init();
    listkindOfMusicAll();
    if(kind!==0){
        listAlbumbyIdKindOfMusic(kind)
    }else{
        if(artistId!==0)
            listalbumByArtist(artistId)
        else{
            listAlbumAll();
        }
    }





</script>
