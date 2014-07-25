# Jtqa

This README outlines the details of collaborating on this Ember application.

## Installation

* `git clone` this repository
* `npm install`
* `bower install`

## Running

* `ember server`
* Visit your app at http://localhost:4200.

## Running Tests

* `ember test`
* `ember test --server`

## Building

* `ember build`

## 개발 이슈
* 페이지네이션에서 query-params 기능을 사용하기 위해서는 ember canary build 버전을 사용해야 한다.
bower.json
-    "ember": "1.6.1",
+    "ember": "components/ember#canary",

+  "resolutions": {
+    "ember": "canary"
+    }

그리고 environment.js 파일에서 다음과 같이 query-params-new: true를 추가해야 한다.

EmberENV: {
  FEATURES: {
    // Here you can enable experimental features on an ember canary build
    // e.g. 'with-controller': true
+    'query-params-new': true
  }
},


For more information on using ember-cli, visit [http://iamstef.net/ember-cli/](http://iamstef.net/ember-cli/).
