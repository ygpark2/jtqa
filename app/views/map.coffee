
Map = Ember.View.extend
    layoutName: 'pagelayout',
    didInsertElement: ->
      mapOptions =
        center: new google.maps.LatLng(-34.397, 150.644),
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      map = new google.maps.Map(@.$("#map").get(0),mapOptions)
      @set('map', map)
    ,
    redrawMap: ->
      newLoc = new google.maps.LatLng(@get('latitude'), @get('longitude'));
      @get('map').setCenter(newLoc)
      observes('latitude','longitude')