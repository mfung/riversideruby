App.Views.PagesIndex = Backbone.View.extend({
  initialize: function() {
    _.bindAll(this, 'render');
    this.render();
  },
  
  render: function() {
    $('#app').empty();
    $('#app').html("<h1>RiversideRuby</h1<p>We are a group of programmers, designers, and hackers located in the Inland Empire who share a common bond of Ruby.</p>");
    
    return this;
  }
});