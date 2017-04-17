function filterLinks(){
  $('#filter-link').keyup(function(){
    var rows = $('#all-links').find('div').hide();
      if (this.value.length) {
        filterRows(this, rows)
      } else rows.show()
  });
}

function filterRows(self, rows){
  var data = self.value.split(" ");
  $.each(data, function(i, v) {
    rows.filter(":contains('" + v + "')").show();
  });
}

function showRead(){
  $('#all-links').children('.readLinks').show();
  $('#all-links').children('.unreadLinks').hide();
}

function showUnread(){
  $('#all-links').children('.readLinks').hide();
  $('#all-links').children('.unreadLinks').show();
}

$(document).ready(function(){
  filterLinks();
  $("body").on("click", "#show-read", showRead)
  $("body").on("click", "#show-unread", showUnread)
})
