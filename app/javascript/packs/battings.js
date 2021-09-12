$(document).on('turbolinks:load', function () {
  $('#team_name').on('change', function () {
    window.location.href = '/battings?team_name=' + this.value;
  });
})

$(document).on('turbolinks:load', function () {
  $('#date_year').on('change', function () {
    alert(this.value);
  });
})