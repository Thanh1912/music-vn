//Search
$(function () {
    $(".tracks").hide();
    $("#video-youtube").hide();
    $("#btn-ytube").click(function () {
        $("#video-youtube").slideToggle();
        $('body').css('overflow') == "hidden" ?
            $('html, body').css('overflow', 'visible') :
            $('html, body').css('overflow', 'hidden');
    });
    $("#search-song").keyup(function () {
       var input= $("#search-song").val();
        input

        $.ajax({
            url: "http://localhost:8080/apitest/music/search/byname?song="+input,
            type:  "get",
            dataType: 'json',
            data: {},
            success: function (result) {
                if(input==""){
                    $("#item-song").html("");
                }else{
                    $("#item-song").html("");
                    for (var i=0; i<result.listDTo.length; i++) {
                        $("#item-song").append(getTemplateSearch(result.listDTo[i]));
                    }
                }
            }
        });


        // $("#item-song").append(getTemplateSearch());
        // if( $("#item-song").val()==="r"){
        //     $("#item-song").empty();
        // }
    });
    function getTemplateSearch(item){
        var url="http://localhost:8080/resources/music/images/song/"+item.thumb;
     return "<li class=\"list-group-item  item-song clearfix\">\n"+
         "                                <a href='http://localhost:8082/vn-music/player?albumId=" +item.albumDTO[0].id+"' class=\"pull-left thumb-sm m-r\">\n" +
         "                                    <img src="+url+" alt=\"...\">" +
         "                                </a>\n" +
         "                                <a class=\"clear\" href='http://localhost:8082/vn-music/player?albumId=" +item.albumDTO[0].id+"'>\n" +
         "                                    <span class=\"block text-ellipsis\">"+item.name+"</span>\n" +
         "                                    <small class=\"text-muted\">by "+item.InfoByNameAuthor.username+"</small>\n" +
         "                                </a>\n" +
         "                            </li>";
    }
    $(".btn-playplist").click(function () {
        $(".tracks").toggle();
    });
});
var albumeId=0;




