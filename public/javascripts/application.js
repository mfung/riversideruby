var App = {
  Views: {},
  Controllers: {},
  Collections: {},
  init: function() {
    new App.Controllers.Pages();
    Backbone.history.start();
  }
}