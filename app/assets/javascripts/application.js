// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function()
{

  var cardTemplateSource = $('#card-template').text();
  var cardTemplate = Handlebars.compile(cardTemplateSource);
  var photosTag = $(".photos");

 $.ajax(
 {
    type: "GET",
    dataType: "jsonp",
    cache: false,
    url: "https://api.instagram.com/v1/tags/torreslovesyou/media/recent?access_token=1830054420.1fb234f.82b9a3e9e60648debf0eae889ff4f8f3" ,
    success: function(data) {
      console.log(data);
      for (var i = 0; i < 12; i++)
      {
        var item = data.data[i];
        photosTag.append(
          cardTemplate(
          {
            link: item.link,
            tagline: item.user.profile_picture,
            photo: item.images.low_resolution.url,
            username: item.user.username
          })
        );
      }
    }
  });
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
