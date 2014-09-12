`import Ember from "ember"`

Obj = Ember.Component.extend
  insertMap: (->
    container = @$(".map-canvas")

    options = {
      center: new google.maps.LatLng(@get("latitude"), @get("longitude")),
      zoom: 17,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }

    Ember.Logger.debug "---------------------"
    Ember.Logger.debug container
    Ember.Logger.debug @.$(".map-canvas").get(0)
    Ember.Logger.debug $(".map-canvas").get(0)
    Ember.Logger.debug container.get(0)
    Ember.Logger.debug "---------------------"
    new google.maps.Map($(".map-canvas").get(0), options)
  ).on('didInsertElement')

`export default Obj`
