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

$(document).ready(function(){
  filterLinks();
})