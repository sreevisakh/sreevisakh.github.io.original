---
layout: post
title: Install webpack app on heroku
category : 'webpack'
---

Heroku doesn't support a webpack buitpack by default. So you normal nodejs build wont build you code. Here is a trick to run youcr build script in heroku deploy

add `postinstall` section in your package.json, script section. So after downloading necessary dependencies heroku will run this command.

for example:

```json
{
  "script":{
    "postinstall" : "webapck --config=webpack.production.config.js"
  }
}
```
