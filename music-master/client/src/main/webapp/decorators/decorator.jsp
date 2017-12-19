<html>
<head>
    <title><sitemesh:write property='title'/></title>
    <meta charset="utf-8"/>
    <meta name="description"
          content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1"/>
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
    <script
            src="<%=request.getContextPath()%>/resources/music/js/jquery.min.js"></script>

    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/Control/app.js"></script>
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/music/css/mediaelementplayer.min.css"
          type="text/css"/>
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/music/css/mep.css"
          type="text/css"/>
    <script type="text/javascript" src="/resources/Control/login.js"></script>

    <script>
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


    </script>

</head>

<body>

<section class="vbox">
    <%@include file="header.jsp" %>
    <section>
        <section class="hbox stretch">
            <!-- .aside -->
            <%@include file="sidebar.jsp" %>
            <!-- /.aside -->
            <section id="content">

                <sitemesh:write property='title'/>
                <sitemesh:write property='body'/>

                <%--<%@include file="footer.jsp" %>--%>
            </section>
        </section>
    </section>
</section>
<!-- Bootstrap -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/music/js/bootstrap.js"></script>
<!-- App -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/music/js/url.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/music/js/app.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/music/js/slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/music/js/masonry/tiles.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/music/js/masonry/demo.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/music/js/app.plugin.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/music/js/jPlayer/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/music/js/jPlayer/add-on/jplayer.playlist.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/music/js/jPlayer/demo.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>

</body>

</html>