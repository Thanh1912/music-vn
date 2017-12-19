<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="video-youtube">
</div>
    <section class="vbox">
        <section class="w-f-md">
            <section class="hbox stretch bg-black dker">
                <!-- side content -->
                <aside class="col-sm-5 no-padder" id="sidebar">
                    <section class="vbox animated fadeInUp">
                        <section class="scrollable">
                            <div class="m-t-n-xxs item pos-rlt" id="top-album">


                            </div>
                            <ul id="list-album-player" class="list-group list-group-lg no-radius no-border no-bg m-t-n-xxs m-b-none auto">

                            </ul>
                        </section>
                    </section>
                </aside>
                <!-- / side content -->
                <section class="col-sm-4 no-padder bg">
                    <section class="vbox">
                        <section class="scrollable hover">
                            <ul id="list-album" class="list-group list-group-lg no-bg auto m-b-none m-t-n-xxs">

                            </ul>
                        </section>
                    </section>
                </section>
            </section>
        </section>
    </section>
    <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
<div class="app-footer app-player grey bg">
    <div class="playlist mep-tracks-count-3 has-artwork is-tracklist-open" style="width:100%">
        <span class="mejs-offscreen">Audio Player</span>
        <div id="mep_0" class="mejs-container mejs-audio" tabindex="0" role="application" aria-label="Audio Player" style="width: 100%; height: 40px;">
            <div class="mejs-inner">

                <div class="mejs-layers">
                    <div class="mejs-poster mejs-layer" style="display: none; width: 100%; height: 40px;"></div>
                    <%--<div class="mejs-track-actions">--%>
                    <%--<button class="mejs-like-button btn btn-sm no-bg btn-icon" track-id="item-1"></button>--%>
                    <%--</div>--%>
                    <a class="mejs-track-artwork" href=""></a>
                    <div class="mejs-track-details">
                            <span class="mejs-track-title">
                              xxxxx
                            </span>
                        <span class="mejs-track-author">
                            xxxxx
                            </span>
                    </div>

                </div>
                <div class="mejs-controls">
                    <%--<div class="mejs-button mejs-previous-button mejs-previous">--%>
                    <%--<button type="button" aria-controls="mep_0" title="Previous Track"></button>--%>
                    <%--</div>--%>
                    <%--<div class="mejs-button mejs-playpause-button mejs-play">--%>
                    <%--<button type="button" aria-controls="mep_0" title="Play" aria-label="Play"></button>--%>
                    <%--</div>--%>
                    <%--<div class="mejs-button mejs-next-button mejs-next">--%>
                    <%--<button type="button" aria-controls="mep_0" title="Next Track"></button>--%>
                    <%--</div>--%>

                    <%--<div class="mejs-button mejs-repeat-button mejs-repeat">--%>
                    <%--<button type="button" aria-controls="mep_0" title="Repeat"></button>--%>
                    <%--</div>--%>
                    <%--<div class="mejs-button mejs-shuffle-button mejs-repeat">--%>
                    <%--<button type="button" aria-controls="mep_0" title="Shuffle"></button>--%>
                    <%--</div>--%>

                    <div id="btn-youtube" style="margin-left: 900px">
                        <button id="btn-ytube" class="btn btn-rounded btn-sm btn-danger" type="button">
                            <i class="icon-social-youtube"></i>
                        </button>
                    </div>
                </div>
                <div class="mejs-clear"></div>
            </div>
        </div>
    </div>
</div>

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


    function init() {
        if(getUrlParameter("albumId")!==undefined){
            albumeId=getUrlParameter("albumId")
        }
    }
    init();




    function getTemplateAlbumLeft(item){
        return "<li class=\"list-group-item clearfix\">\n"+
            "                                    <a  class=\"jp-play-me pull-right m-t-sm m-l text-md\">\n"+
            "                                        <i class=\"icon-control-play text\"></i>\n"+
            "                                        <i class=\"icon-control-pause text-active\"></i>\n"+
            "                                    </a>\n"+
            "                                    <a href=\"#\" class=\"pull-left thumb-sm m-r\">\n"+
            "                                        <img src=\"http://localhost:8080/resources/music/images/album/"+item.poster+"\" alt=\"...\">\n"+
            "                                    </a>\n"+
            "                                    <a href='/vn-music/player?albumId="+item.id+"' class=\"clear\" >\n"+
            "                                        <span class=\"block text-ellipsis\">"+item.name+"</span>\n"+
            "                                        <small class=\"text-muted\"></small>\n"+
            "                                    </a>\n"+
            "                                </li>"
    }
    function getTemplateSongInAlbum(item,i) {
        var id=item.hostMovieId;
    return "<li class='list-group-item'>"+
        "<div class='pull-right m-l'>"+
//        "<a href='#' class='m-r-sm'><i class='icon-cloud-download'></i></a>"+
//        "<a href='#' class='m-r-sm'><i class='icon-plus'></i></a>"+
//        "<a href='#'><i class='icon-close'></i></a>"+
        "</div>"+
        " <a  onclick='addPlayer("+i+")' class='jp-play-me m-r-sm pull-left'>"+
        "<i class='icon-control-play text'></i>"+
        "<i class='icon-control-pause text-active'></i>"+
        " </a>"+
        " <div class='clear text-ellipsis'>"+
        " <span>"+item.name+"</span>"+
//        " <span class='text-muted'> -- 04:35</span>"+
        " </div>"+
        " </li>";
    }
    function getTempleteTopAlbum(item){
        return "<div class='top text-right'>"+
            " <span class='musicbar animate bg-success bg-empty inline m-r-lg m-t' style='width:25px;height:30px'>"+
        "  <span class='bar1 a3 lter'></span>"+
        "  <span class='bar2 a5 lt'></span>"+
        "  <span class='bar3 a1 bg'></span>"+
        " <span class='bar4 a4 dk'></span>"+
        "  <span class='bar5 a2 dker'></span>"+
        " </span>"+
        " </div>"+
        "<div class='bottom gd bg-info wrapper-lg'>"+
        "<span class='h2 font-thin'>"+item.name+"</span>"+
        "</div>"+
        "<img style='height:300px' class='img-full' src='http://localhost:8080/resources/music/images/album/"+item.poster+"' alt='...'>";
    }
    function listAlbumPlayer() {
        $.ajax({
            url: "http://localhost:8080/apitest/album-top",
            type: "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                for (var i = 0; i < result.length; i++) {
                    $("#list-album").append(getTemplateAlbumLeft(result[i]))
                }

            }
        });
    }
    function AlbumTop() {
        if(albumeId!=0)
        $.ajax({
            url: "http://localhost:8080/apitest/album/"+albumeId,
            type: "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                    $("#top-album").append(getTempleteTopAlbum(result))
            }
        });
    }
    function listSongPlayer() {
        if(albumeId!=0)
        $.ajax({
            url: "http://localhost:8080/apitest/music/search/byalbum/"+albumeId,
            type: "get",
            dataType: 'json',
            success: function (result) {
                listPlayer=[];
                for (var i = 0; i < result.listDTo.length; i++) {
                    $("#list-album-player").append(getTemplateSongInAlbum(result.listDTo[i],i))
                    listPlayer.push(result.listDTo[i].hostMovieId);
                }
            }
        });
    }
    listAlbumPlayer();
    listSongPlayer();
    AlbumTop();
</script>
</body>
</html>
