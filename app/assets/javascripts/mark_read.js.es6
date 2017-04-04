$( document ).ready(function(){
  loadReadWebsites()
  $("body").on("click", ".mark-as-read", markAsRead)
})

function loadReadWebsites(){
  $.ajax({
    url: '/api/v1/links',
    method: 'GET'
  }).done(function(response){
    debugger;
  }).fail(function(error){
    console.log(error)
  })
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
  $(`.link input[name=${link.id}]`).parent('.link').addClass('readLinks');
  $(`.link input[name=${link.id}]`).parent('.link').children('.mark-as-read').text('Mark as Unread').addClass('unread')
  markAsUnread(link.id);
}

function markAsUnread(link_id){
  var unreadUrl = $(`.link input[name=${link_id}]`).siblings('.unread')
  $(unreadUrl).on('click', function(e){
    e.preventDefault();
    var $link = $(this).parents('.link');
    var linkId = $link.children('#link-id')[0].name
    
    $.ajax({
      type: "PATCH",
      url: "/api/v1/links/" + linkId,
      data: { read: false },
    }).then(updateNewLinkStatus)
      .fail(displayFailure);
  })
}

function updateNewLinkStatus(link){
  $(`.link input[name=${link.id}]`).siblings('.read-status').text(`Read? ${link.read}`);
  $(`.link input[name=${link.id}]`).parent('.link').removeClass('readLinks')
  $(`.link input[name=${link.id}]`).siblings('.mark-as-read').text('Mark as Read').removeClass('unread')
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
