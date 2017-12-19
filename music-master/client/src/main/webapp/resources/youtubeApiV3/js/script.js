// Search  bar handler
var publicDate_SrcSong="";
var dataYoutube={};
$(function () {
    var fieldContainer = $('.field-container')
    var searchField = $('#query');
    var icon = $('#search-btn');

    //Focus handler
    $(searchField).on('focus', function () {
        $(this).animate({
            width: '100%'
        }, 400);
        $(icon).animate({
            right: '-30px'
        }, 400);
    });

    //Blur event handler
    $(searchField).on('blur', function () {
        if (searchField.val() == '') {
            $(this).animate({
                width: '50%'
            }, 400, function () {
            });
            $(icon).animate({
                right: '170px'
            }, 400, function () {
            });
        }
    });

    $('#search-form').submit(function (e) {
        e.preventDefault();
    });

    $('.fancybox').fancybox();
});
function toDataURL(url, callback) {
    var xhr = new XMLHttpRequest(); xhr.onload = function() {
        var reader = new FileReader(); reader.onloadend = function() {
            // $("#img").attr('src',reader.result);
            callback(reader.result);
        }
        reader.readAsDataURL(xhr.response);
    }; xhr.open('GET', url,true); xhr.responseType = 'blob'; xhr.send();
}
// toDataURL('https://zmp3-photo.zadn.vn/thumb/240_240/covers/8/d/8d2eb54d5bc19763317dd1ee490edeb1_1463039216.jpg', function(dataUrl) {
//     console.log('RESULT:', dataUrl)
//     $("#imagePreviewSong").html();
//     $(".imagePreviewSong").append("<img src='"+dataUrl+"' id='img-Youtube' />")
// })

function LoadImageYoutube() {
    var url= $("#url-youtube").val();
    toDataURL(url, function(dataUrl) {
        $("#imagePreviewSong").html("");
        $("#imagePreviewSong").append("<img src='"+dataUrl+"' id='img-Youtube' />")

    })
}
function search() {
    // Clear results
    $('#results').html('');
    $('#buttons').html('');

    // Get form input
    q = $('#query').val();

    // Run GET request on API
    $.get(
        "https://www.googleapis.com/youtube/v3/search", {
            part: 'snippet, id',
            q: q,
            type: 'video',
            maxResults: '20',
            key: 'AIzaSyB2ZAvVvmlnTkZiewSZZl8nMHS5Ookm-tY'
        },
        function (data) {
            var nextPageToken = data.nextPageToken;
            var prevPageToken = data.prevPageToken;
            dataYoutube=data;
            // Log data
            console.log(data);

            $.each(data.items, function (i, item) {
                // get output
                var output = getOutput(item,i);

                // Display results
                $('#results').append(output);
            });

            var buttons = getButtons(prevPageToken, nextPageToken)

            //Display buttons
            $('#buttons').append(buttons);
        }
    );
}

//Next Page Function
function nextPage() {
    var token = $('#next-button').data('token');
    var q = $('#next-button').data('query');

    // Clear results
    $('#results').html('');
    $('#buttons').html('');

    // Get form input
    q = $('#query').val();

    // Run GET request on API
    $.get(
        "https://www.googleapis.com/youtube/v3/search", {
            part: 'snippet, id',
            q: q,
            pageToken: token,
            type: 'video',
            maxResults: '20',
            key: 'AIzaSyB2ZAvVvmlnTkZiewSZZl8nMHS5Ookm-tY'
        },
        function (data) {
            var nextPageToken = data.nextPageToken;
            var prevPageToken = data.prevPageToken;
            dataYoutube=data;
            // Log data
            console.log(data);

            $.each(data.items, function (i, item) {
                // get output
                var output = getOutput(item,i);

                // Display results
                $('#results').append(output);
            });

            var buttons = getButtons(prevPageToken, nextPageToken)

            //Display buttons
            $('#buttons').append(buttons);
        }
    );
}

//Next Page Function
function prevPage() {
    var token = $('#prev-button').data('token');
    var q = $('#prev-button').data('query');

    // Clear results
    $('#results').html('');
    $('#buttons').html('');

    // Get form input
    q = $('#query').val();

    // Run GET request on API
    $.get(
        "https://www.googleapis.com/youtube/v3/search", {
            part: 'snippet, id',
            q: q,
            pageToken: token,
            type: 'video',
            maxResults: '20',
            key: 'AIzaSyB2ZAvVvmlnTkZiewSZZl8nMHS5Ookm-tY'
        },
        function (data) {
            var nextPageToken = data.nextPageToken;
            var prevPageToken = data.prevPageToken;
            dataYoutube=data;
            // Log data
            console.log(data);

            $.each(data.items, function (i, item) {
                // get output
                var output = getOutput(item,i);

                // Display results
                $('#results').append(output);
            });

            var buttons = getButtons(prevPageToken, nextPageToken)

            //Display buttons
            $('#buttons').append(buttons);
        }
    );
}
var jsonDate={}
// Build output
function getOutput(item,i) {
    var videoId = item.id.videoId;
    var title = item.snippet.title;
    var description = item.snippet.description;
    var thumb = item.snippet.thumbnails.high.url;
    var channelTitle = item.snippet.channelTitle;
    var videoDate = item.snippet.publishAt;
    // Build output string
    var output = '<li>' +
        '<div class="list-left">' +
        '<a class="fancybox fancybox.iframe" href="http://www.youtube.com/embed/' + videoId + '">' + '<img src="' + thumb + '">' + '</a>' +
        '</div>' +
        '<div class="list-right">' +
        '<h2><a class="fancybox fancybox.iframe" href="http://www.youtube.com/embed/' + videoId + '">' + title + '</a></h2>' +
        '<small>By <span class="cTitle">' + channelTitle + '</span> on' + videoDate + '</small>' +
        '<p>' + description + '</p>' +
        '  <button type="button" id="item-'+i+'" data-item="'+jsonDate+'" onclick="loadDateYoutube('+i+')" class="btn btn-info btn-lg"' +
        '          data-toggle="modal" data-target="#myModal"><i class="fa fa-plus fa-fw m-r-xs"></i> Tạo mới' +
        '  </button>' +
        '</div>' +
        '</li>' +
        '<div class="clearfix"></div>';

    return output;
}
function loadDateYoutube(id) {
    var dataYoutubeId=dataYoutube.items[id];
    var videoId = dataYoutubeId.id.videoId;
    var title = dataYoutubeId.snippet.title;
    var description = dataYoutubeId.snippet.description;
    var thumb = dataYoutubeId.snippet.thumbnails.high.url;
    // var channelTitle = dataYoutubeId.snippet.channelTitle;
    $('#hostIdVideo').val(videoId);
    $('#title-youtbe').val(title);
    $('#description').val(description);
    $('#url-youtube').val(thumb);
    // console.log(dataYoutubeId);
}

// Build the buttons
function getButtons(prevPageToken, nextPageToken) {
    if (!prevPageToken) {
        var btnOutput = '<div class="button-container">' +
            '<button id="next-button" class="paging-button" data-token="' + nextPageToken + '" data-query="' + q + '"' +
            'onclick="nextPage();">Next</button>' +
            '</div>';
    } else {
        var btnOutput = '<div class="button-container">' +
            '<button id="prev-button" class="paging-button" data-token="' + prevPageToken + '" data-query="' + q + '"' +
            'onclick="prevPage();">Previous</button>' +
            '<button id="next-button" class="paging-button" data-token="' + nextPageToken + '" data-query="' + q + '"' +
            'onclick="nextPage();">Next</button>' +
            '</div>';
    }
    return btnOutput;
}





