# ImageOrNot

## Setup

```bash
bundle
rackup
```

## Example

```js
var urlToTest = 'http://www.picturesnew.com/media/images/image-background.jpg';

var request = new XMLHttpRequest();
request.open('POST', 'http://localhost:9292', true);
request.setRequestHeader('Content-type', 'application/json')

request.onreadystatechange = function() {
  if (request.readyState != 4 || request.status != 200) return;

  var result = JSON.parse(request.responseText);
  if (result.is_image) {

  } else {

  }
};

request.send(JSON.stringify({ url: urlToTest }));
```

## Motivation

I need CORS enabled service that will tell if URL leads to image or not.
