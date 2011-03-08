var App = {
  Views: {},
  Controllers: {},
  init: function() {
    new App.Controllers.Pages();
    Backbone.history.start();
  }
}