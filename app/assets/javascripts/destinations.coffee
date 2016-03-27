$ ->
  $('#files-upload').fileupload
    progressall: (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10)
      $('.progress .progress-bar').text(progress + '%')
      $('.progress .progress-bar').css 'width', progress + '%'
      $('.progress .progress-bar').attr 'aria-valuenow', progress

  $('#files-upload').bind 'fileuploadstart', (e, data) ->
    $(".progress").css 'opacity', '1.0'

  $('#files-upload').bind 'fileuploadstop', (e, data) ->
    setTimeout (->
      $(".progress").fadeTo 1000, 0, ->
        $('.progress .progress-bar').text '0%'
        $('.progress .progress-bar').css 'width', '0%'
      ), 1000

  $('.modal').on 'shown.bs.modal', ->
    $(this).find('input:text:visible:first').focus()
