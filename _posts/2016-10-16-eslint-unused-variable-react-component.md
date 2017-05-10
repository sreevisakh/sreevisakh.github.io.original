---
layout: post
title: Unused variable  eslint error in react component
comments : true
category : 'javascript'
---

### Problem

If you are working with react and uses eslint for linting your code, you may get the following error

```js
import Nav from './nav'
....
render(){
<Nav>
}
```

The above code will throw unused variable error eventhough it is used in render.



### Solution

Create a .eslintrc.json file, if you dont have already, add the following lines



```json
{
  "rules": {
    "react/jsx-uses-vars": 1
	}
}
```
