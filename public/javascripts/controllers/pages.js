App.Controllers.Pages = Backbone.Controller.extend({
  routes: {
    "":                   "index",
    "/about-us":          "aboutus"
  },
  
  index: function() {
      new App.Views.PagesIndex();
  },
  
  aboutus: function() {
      new App.Views.PagesAboutUs();
  }
  
});