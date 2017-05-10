---
layout: post
title: react-beautify breaking chained methods
comments : true
category : 'javascript'
---

### Problem

If you ae using VS Code, and uses `react-beautify` to fomat your code, Your chained methods sometimes load in different lines as follows

```js
$
.get('/api/data')
.then(process)
.error(handleError)
```



### Solution

Create a .jsbeautifyrc file, if you dont have already, add the following lines



```json
{
    "methodchain": "chain"
}
```
