function addNewLink(){
  $('#create-link').on('click', function(e){
    event.preventDefault;
    var linkTitle = $('#link-title').val();
    var linkUrl   = $('#link-url').val()
    var linkData = {'title': linkTitle, 'url': linkUrl}
    $.ajax({
      url: '/api/v1/links',
      method: 'POST',
      data: JSON.stringify(linkData)
    }).done(function(link){
      appendLink(link);
      clearForms();
    }).fail(function(error){
      console.log(error)
    })
  })
}

function appendLink(link){
  $('#all-links').prepend("<div class='link'><li>Title: " + link.title +
    "</li><li>URL: <a href=" + link.url + ">" + link.url +"</a></li> <input type='hidden' name=" + 
    link.id +" id='link-id'>" + "<li class='read-status'>Read? " + link.read + 
    "</li><button class='mark-as-read'>Mark as Read</button>" +
    "</div>")
}

function clearForms(){
  $('#link-title').val("")
  $('#link-url').val("")
}

$(document).ready(function(){
  addNewLink();
})