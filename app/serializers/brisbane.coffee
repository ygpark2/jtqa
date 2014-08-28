`import DS from 'ember-data'`

Obj = DS.RESTSerializer.extend DS.EmbeddedRecordsMixin
  attrs:
    tags:
      embedded: 'always'

`export default Obj`