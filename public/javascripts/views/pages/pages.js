App.Views.PagesIndex = Backbone.View.extend({
  initialize: function() {
    _.bindAll(this, 'render');
    this.render();
  },
  
  render: function() {
    $('#app').empty();
    $('#app').html("<h1>RiversideRuby</h1><p>We are a group of programmers, designers, and hackers located in the Inland Empire who share a common bond of Ruby. Testing.</p>");
    
    return this;
  }
});

App.Views.PagesAboutUs = Backbone.View.extend({
  initialize: function() {
    _.bindAll(this, 'render');
    this.render();  
  },
  
  render: function() {
    $('#app').empty();
    $('#app').html("<h1>About Us</h1><p>Happy go lucky!</p>");
  }
  
});