jQuery ->
  ###
  $("a[rel=popover]").popover()
  $("[data-toggle=popover]").popover()
  ###
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()


  $('[rel=popover]').popover({  
    html : true,
    content: ->
      content_id = $(this).attr('id') + "_content";
      console.log(content_id);
      return $('#' + content_id).html();
  });

