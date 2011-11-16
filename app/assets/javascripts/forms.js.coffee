$ ->
  # Adds .error class to the .clearfix parent of all .field_with_errors
  $('form .field_with_errors').parent('.clearfix').addClass('error')