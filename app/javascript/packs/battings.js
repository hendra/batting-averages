$(document).on('turbolinks:load', function () {
  $('#team_name').on('change', function () {
    const urlParams = new URLSearchParams(window.location.search);
    const year = urlParams.get('year');
    if (year !== '')
      window.location.href = '/battings?year=' + year + '&team_id=' + this.value;
    else
      window.location.href = '/battings?team_id=' + this.value;
  });

  $('#date_year').on('change', function () {
    const urlParams = new URLSearchParams(window.location.search);
    const team_id = urlParams.get('team_id');
    if (team_id !== '')
      window.location.href = '/battings?team_id=' + team_id + '&year=' + this.value;
    else
      window.location.href = '/battings?year=' + this.value;
  });

  $('#attachment').on('change', function () {
    if (this.files.length == 0)
      $('#submit').attr('disabled', 'disabled');
    else
      $('#submit').attr('disabled', false);
  });
})
