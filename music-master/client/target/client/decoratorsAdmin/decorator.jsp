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
    <style>
        body {
            font-family: "Open Sans", sans-serif;
            line-height: 1.6em;
            color: #bac3cc;
            font-size: 14px;
        }
        .btn-home{

        }
        .showMessage-success,.showMessage-error{
            display: none;
            position: absolute;
            z-index: 1041;
        }
    </style>
    <script type="text/javascript" src="/resources/Control/login.js"></script>


</head>

<body class="container">
<section class="vbox">
    <%@include file="header.jsp" %>
    <section>
        <div class="alert alert-success showMessage-success" >
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <i class="fa fa-ok-sign"></i><strong> done!</strong>
            <p id="message-success"></p>
        </div>
        <div class="alert alert-danger showMessage-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <i class="fa fa-ban-circle"></i><p id="message-error"></p>
        </div>

        <section class="hbox stretch">
            <!-- .aside -->
            <%@include file="sidebar.jsp" %>
             <!-- /.aside -->
            <section id="content">

                <sitemesh:write property='title'/>
                <sitemesh:write property='body'/>

                <%@include file="footer.jsp" %>
            </section>
        </section>
    </section>
</section>
<!-- Bootstrap -->
<script src="<%=request.getContextPath()%>/resources/music/js/bootstrap.js"></script>
<!-- App -->
<script src="<%=request.getContextPath()%>/resources/music/js/app.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/music/js/slimscroll/jquery.slimscroll.min.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/music/js/masonry/tiles.min.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/music/js/masonry/demo.js"></script>
<script
        src="<%=request.getContextPath()%>/resources/music/js/app.plugin.js"></script>
<script type="text/javascript"
        src="<%=request.getContextPath()%>/resources/music/js/jPlayer/jquery.jplayer.min.js"></script>
<script type="text/javascript"
        src="<%=request.getContextPath()%>/resources/music/js/jPlayer/add-on/jplayer.playlist.min.js"></script>
<script type="text/javascript"
        src="<%=request.getContextPath()%>/resources/music/js/jPlayer/demo.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>
<script>
    function FAlert(message,status) {
        if(status=="error"){
            $(".showMessage-error").css("display","block");
            $("#message-error").html(message);
        }else{
            $(".showMessage-success").css("display","block");
            $("#message-success").html(message);
        }
    }
</script>
</body>

</html>