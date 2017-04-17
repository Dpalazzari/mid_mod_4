function editLink(){
  // var linkId   = $(this).siblings('input')[0].name
  // var title    = $(this).siblings('.specificTitle').text()
  // var url      = $(this).siblings('.specificUrl').text()
  // var newTitle = $(this).siblings('.specificTitle').append("<input type='text' placeholder='New Title' />")
  // var newUrl   = $(this).siblings('.specificUrl').append("<input type='text' placeholder='New Url' />")
  // $(this).append("<button class='submitEdits'>Submit</button>")
  debugger;
}

$(document).ready(function(){
  $("body").on('click', ".edit-button", editLink)
})
