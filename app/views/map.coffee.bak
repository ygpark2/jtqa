`import Ember from "ember"`
`import GoogleMapsLoader from "google-maps"`

GoogleMap = Ember.View.extend
	id: 'map_canvas',
  tagName: 'div',

  attributeBindings: ['style'],
  style:"width:100%; height:550px",

  map:null,

  markers:[],
  
  didInsertElement: ->
    GoogleMapsLoader.load (google) ->
      mapOptions =
        center: new google.maps.LatLng(-34.397, 150.644),
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP

      map = new google.maps.Map(@.$().get(0),mapOptions)
      @set('map', map)
          
      geocoder = new google.maps.Geocoder
      geocoderParams =
        address: @get('address') || "19 marong st, sunnybank hills, qld 4109"
        region: "AU"
      results = geocoder.geocode geocoderParams, (results, status) ->
        if status == google.maps.GeocoderStatus.OK
          latlng = results[0].geometry.location
          map.setCenter(latlng)
          map.setZoom(16)

          marker = new google.maps.Marker
            position: latlng,
            title: 'Drag this pin to another location',
            animation: google.maps.Animation.DROP,
            map: map,
            draggable: false

          infoWindow = new google.maps.InfoWindow
            content: """
              <div class='place'>
                     행사일 : 11월 28일 <br/>
                     행사 시간 : 2pm ~ 4pm <br/>
                     주소 : {{@get('address')}}
              </div>
              """

          infoWindow.open(map, marker);
    ,
    
    redrawMap: ->
      newLoc = new google.maps.LatLng(@get('latitude'), @get('longitude'));
      @get('map').setCenter(newLoc)
      observes('latitude','longitude')
      

`export default GoogleMap`