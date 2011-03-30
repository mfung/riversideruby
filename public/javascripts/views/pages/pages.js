App.Views.PagesIndex = Backbone.View.extend({
  initialize: function() {
    _.bindAll(this, 'render');
    this.render();
  },
  
  render: function() {
    $('#app').empty();
    $('#app').load('/javascripts/views/pages/show.html', function() {
      var pagedata =  [
                        {'h1':'Riverside Ruby'},
                        {'body':"We are a group of programmers, designers, and hackers located in the Inland Empire who share a common bond of Ruby. Testing."}
                      ];
      var page = Tempo.prepare('page').render(pagedata);      
    });
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
    $('#app').load('/javascripts/views/pages/show.html', function() {
      var pagedata =  [
                        {'h1':'About Us'},
                        {'body':'Happy go lucky!'}
                      ];
      var page = Tempo.prepare('page').render(pagedata);      
    });
    return this;
  }
  
});