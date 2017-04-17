function loadWebsites(){
  $.ajax({
    url: '/api/v1/links',
    method: 'GET'
  }).done(function(links){
    if(!links.length == 0){
    links.forEach(function(element){
      if(element.read === true){
        formatReadLinkTable(element)
      } else if(element.read === false){
        formatLinkTable(element)
      }
    })
    }
  }).fail(function(error){
    console.log(error)
  })
}

function formatLinkTable(link){
  $('#all-links').prepend("<div class='link unreadLinks'><li class='specificTitle'>Title: " + link.title +
    "</li><li class='specificUrl'>URL: <a href=" + link.url + ">" + link.url +"</a></li> <input type='hidden' name=" +
    link.id +" id='link-id'>" + "<li class='read-status'>Read? " + link.read +
    "</li><button class='mark-as-read'>Mark as Read</button><button class='edit-button'>Edit</button>" +
    "</div>")
}

function formatReadLinkTable(link){
  $('#all-links').prepend("<div class='link readLinks'><li class='specificTitle'>Title: " + link.title +
    "</li><li class='specificUrl'>URL: <a href=" + link.url + ">" + link.url +"</a></li> <input type='hidden' name=" +
    link.id +" id='link-id'>" + "<li class='read-status'>Read? " + link.read +
    "</li><button class='unread'>Mark as Unread</button><button class='edit-button'>Edit</button>" +
    "</div>")
}

function markAsRead(e) {
  e.preventDefault();
  var $link = $(this).parents('.link');
  var linkId = $link.children('#link-id')[0].name
  var urlString = $(this).siblings('.linkUrl').text()
  updateHotReads(urlString);
  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateHotReads(string){
  var urlString = string.slice(5)
  var stringData = { 'url': urlString}
  $.ajax({
    url: 'https://drews-hot-reads.herokuapp.com/api/v1/links',
    method: 'POST',
    data: JSON.stringify(stringData)
  }).done(function(link){
    console.log(link)
  }).fail(function(error){
    console.log(error)
  })
}

function updateLinkStatus(link) {
  $(`.link input[name=${link.id}]`).siblings('.read-status').text(`Read? ${link.read}`);
  $(`.link input[name=${link.id}]`).parent('.link').addClass('readLinks').removeClass('unreadLinks');
  $(`.link input[name=${link.id}]`).parent('.link').children('.mark-as-read').text('Mark as Unread').addClass('unread').removeClass('mark-as-read')
}

function markAsUnread(e){
  e.preventDefault();
  var $link = $(this).parents('.link');
  var linkId = $link.children('#link-id')[0].name
    $.ajax({
      type: "PATCH",
      url: "/api/v1/links/" + linkId,
      data: { read: false },
    }).then(updateNewLinkStatus)
      .fail(displayFailure);
}

function updateNewLinkStatus(link){
  $(`.link input[name=${link.id}]`).siblings('.read-status').text(`Read? ${link.read}`);
  $(`.link input[name=${link.id}]`).parent('.link').removeClass('readLinks').addClass('unreadLinks')
  $(`.link input[name=${link.id}]`).siblings('.unread').text('Mark as Read').removeClass('unread').addClass("mark-as-read")
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}

function getTopTen(){
  $.ajax({
    url: "https://drews-hot-reads.herokuapp.com/api/v1/links/top_ten",
    method: 'GET'
  }).done(function(links){
    links.forEach(function(link){
      var currentLinks = $('#all-links').children('div').children('.specificUrl').children()
      for(var i = currentLinks.length - 2; i > 0; i--){
        var childUrl = currentLinks[i].firstChild.data
        if(link.url == childUrl){
          var targetLink = $('#all-links').children('div')[i].append("Hot Reads top ten!")
        }
      }
    })
  }).fail(function(error){
    console.log(error)
  })
}

$( document ).ready(function(){
  loadWebsites()
  getTopTen()
  $("body").on("click", ".mark-as-read", markAsRead)
  $("body").on("click", ".unread", markAsUnread)
})
