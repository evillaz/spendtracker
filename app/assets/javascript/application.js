//= require jquery
//= require rails-ujs
//= require_tree .
$(document).ready(function() {
  // Override the click behavior of the "Sign out" link
  $('#sign-out-link').on('click', function(e) {
    e.preventDefault(); // Prevent the default link behavior
    // Trigger a DELETE request to the sign-out path
    $.ajax({
      url: $(this).attr('href'),
      method: 'DELETE',
      dataType: 'script'
    });
  });
});