App.Controllers.Pages = Backbone.Controller.extend({
  routes: {
    "":               "index"
  },
  
  index: function() {
      new App.Views.PagesIndex();
  }
  
});