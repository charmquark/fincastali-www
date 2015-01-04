#= require jquery
#= require jquery_ujs

$ ->
    # are on the sessions#new page?
    if $('#site-page-admin-session-new')?
        # yes, so rig up the form for password encryption
        form = $ 'form'
        field = $ 'input[name=password]'
        form.submit ->
            field.val CryptoJS.MD5(field.val()).toString()
            true

