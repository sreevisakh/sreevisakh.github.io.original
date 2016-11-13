---
layout: post
title: Reverse String using Stack | Data Structures in Js
comments : true
---

```js
const Stack = require('./Stack.class');

function reverseString(string){
    var stack = new Stack();

    string.split('').every(function(letter){
        stack.push(letter);
        return true;
    })
    var reversedString = '';
    var letter=  stack.pop();
    while(letter){
        reversedString += letter;
        letter = stack.pop();
    }
    console.log(reversedString);
    return reversedString;
}
```

