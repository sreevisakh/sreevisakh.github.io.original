---
layout: post
title: Algorithms in Js | Sum Of Pair
comments : true
---
# Sum of Pair

Find the pair of elements which will add upto the given sum


```js

function SumOfPair(array,result){
    array.sort(function(a,b){
        return a - b;
    })
    var start = 0;
    var end = array.length-1;   
    
    for(start = 0;start < array.length; start++ ){
        var sum = array[start]+ array[end];
        if(sum == result){
            return {start : start,end:end};
        }
        if(sum > result){
           end--
        }
        else{
            start++;
        }
    }
}

console.log(SumOfPair([1,2,3,4,5,6,7,8],11));
```

