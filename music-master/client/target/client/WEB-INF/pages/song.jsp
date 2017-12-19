<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title style="display: none">
    Play bài hát
</title>
<style>
    #video-youtube{
        position: absolute;
        width: 96%;
        height:calc(100% - 150px);
        z-index: 10000;
        margin-left: -20px;
    }
</style>
<div id="video-youtube">
</div>


<button class="btn btn-primary" onclick="Loadsong(getUrlParameter('idSong'))">
Play
</button>
<br>

<span>Bài hát:
</span>
<img style="width: 50px;height: 50px" src="" id="img">
<span id="name">
</span>

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
    //init
    var listPlayer=["dVkK36KOcqs"];
    // 2. This code loads the IFrame Player API code asynchronously.
    var tag = document.createElement('script');

    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
    // 3. This function creates an <iframe> (and YouTube player)
    //    after the API code downloads.
    var player;
    function onYouTubeIframeAPIReady() {
        player = new YT.Player('video-youtube', {
            height: '640',
            width: '640',
            videoId: listPlayer[0],
            events: {
//                'onReady': onPlayerReady,
                'onStateChange': onPlayerStateChange
            }
        });
    }
    // 4. The API will call this function when the video player is ready.
    function onPlayerReady(event) {
        event.target.playVideo();
    }
    // 5. The API calls this function when the player's state changes.
    //    The function indicates that when playing a video (state=1),
    //    the player should play for six seconds and then stop.
    var done = false;
    function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
            // setTimeout(stopVideo, 6000);
            done = true;
        }
    }
    function stopVideo() {
        player.stopVideo();
    }
    function addPlayer(i) {
        player.loadVideoById( listPlayer[i]);
        player.playVideo();
    }
    function playerFile(idYoutube) {
        player.loadVideoById( idYoutube);
        player.playVideo();
    }
    function Loadsong(id) {
        $.ajax({
            url: "http://localhost:8080/apitest/music/"+id,
            type: "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                $("#name").html(result.name)
                $("#img").attr("src","http://localhost:8080/resources/music/images/song/"+result.thumb)
                playerFile(result.hostMovieId);
            }
        });
    }

    var idSong=0;
    function init() {
        if(getUrlParameter("idSong")!==undefined){
            idSong=getUrlParameter("idSong");
            Loadsong(idSong);
        }
    }
    init();


</script>