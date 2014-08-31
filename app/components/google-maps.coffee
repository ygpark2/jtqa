`import Ember from "ember"`

Obj = Ember.Component.extend
  insertMap: (->
    container = @$(".map-canvas")

    options = {
      center: new google.maps.LatLng(@get("latitude"), @get("longitude")),
      zoom: 17,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }

    new google.maps.Map(container[0], options)
  ).on('didInsertElement')

`export default Obj`
