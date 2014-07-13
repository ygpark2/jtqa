import DS from "ember-data";

var attr = DS.attr;

var Hotel = DS.Model.extend({
  hotelId: attr('number'),
  name: attr('string'),
  address1: attr('string'),
  city: attr('string'),
  stateProvinceCode: attr('string'),
  postalCode: attr('number'),
  countryCode: attr('string'),
  airportCode: attr('string'),
  supplierType: attr('string'),
  propertyCategory: attr('number'),
  hotelRating: attr('number'),
  confidenceRating: attr('number'),
  amenityMask: attr('number'),
  tripAdvisorRating: attr('number'),
  tripAdvisorReviewCount: attr('number'),
  tripAdvisorRatingUrl: attr('string'),
  locationDescription: attr('string'),
  shortDescription: attr('string'),
  highRate: attr('number'),
  lowRate: attr('number'),
  rateCurrencyCode: attr('string'),
  latitude: attr('number'),
  longitude: attr('number'),
  proximityDistance: attr('number'),
  proximityUnit: attr('string'),
  hotelInDestination: attr('boolean'),
  thumbNailUrl: attr('string'),
  deepLink: attr('string'),
  // RoomRateDetailsList

  // fullName: function() {
  //   return this.get('firstName') + ' ' + this.get('lastName');
  // }.property('firstName', 'lastName')
});

export default Hotel;
