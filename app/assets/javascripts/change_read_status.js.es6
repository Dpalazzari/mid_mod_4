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
  $('#all-links').prepend("<div class='link unreadLinks'><li>Title: " + link.title +
    "</li><li>URL: <a href=" + link.url + ">" + link.url +"</a></li> <input type='hidden' name=" +
    link.id +" id='link-id'>" + "<li class='read-status'>Read? " + link.read +
    "</li><button class='mark-as-read'>Mark as Read</button>" +
    "</div>")
}

function formatReadLinkTable(link){
  $('#all-links').prepend("<div class='link readLinks'><li>Title: " + link.title +
    "</li><li>URL: <a href=" + link.url + ">" + link.url +"</a></li> <input type='hidden' name=" +
    link.id +" id='link-id'>" + "<li class='read-status'>Read? " + link.read +
    "</li><button class='unread'>Mark as Unread</button>" +
    "</div>")
}

function markAsRead(e) {
  e.preventDefault();
  var $link = $(this).parents('.link');
  var linkId = $link.children('#link-id')[0].name
  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStatus)
    .fail(displayFailure);
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

$( document ).ready(function(){
  loadWebsites()
  $("body").on("click", ".mark-as-read", markAsRead)
  $("body").on("click", ".unread", markAsUnread)
})
