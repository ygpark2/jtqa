
GoogleMap = Ember.View.extend
	id: 'map_canvas',
  	tagName: 'div',

  	attributeBindings: ['style'],
  	style:"width:100%; height:550px",

  	map:null,

  	markers:[],
  
    didInsertElement: ->
      mapOptions =
        center: new google.maps.LatLng(-34.397, 150.644),
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      map = new google.maps.Map(@.$().get(0),mapOptions)
      @set('map', map)
    ,
    redrawMap: ->
      newLoc = new google.maps.LatLng(@get('latitude'), @get('longitude'));
      @get('map').setCenter(newLoc)
      observes('latitude','longitude')
      

`export default GoogleMap`