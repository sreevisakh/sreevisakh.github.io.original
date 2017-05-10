---
layout: post
title: Haskell Quick Reference
comments : true
category : 'haskell'
---



#### Datatypes

```haskell

1 			- Num
'a' 		- Char
True		- Bool
[1,2,3]		- List
(1,"Name")	- Tuple

"abc" === ['a','b','c']
```



#### Functions

```haskell
expression in body
let square x = x*x in square 3 -> 9
```

##### Map

```haskell
map (+1) [1..5] -> [2,3,4,5,6]

map toUpper "chris" -> "CHRIS"
```

map accespt a function (here it is +1,toUpper) and list returns a new list

##### Filter

```haskell
filter (>5) [1,2,5,7,8] -> [7,8]
```

##### concat

```haskell
'c' : ['a','b'] -> ['a','b','c']

"abc" === 'a' : 'b' : 'c' : []

[1,2,3,4] ++ [9,10,11,12] === [1,2,3,4,9,10,11,12]
```

##### Pattern Matching

```haskell
let (a,b) = (10,12) in a * 2 -> 20

let (a:b:c:[]) = "xyz" in a -> x

let (a:_) = "xyz" in a -> x

let abc@(a,b,c) = (10,20,30) in (abc,a,b,c) -> ((10,20,30),20,30)

```

##### Get element at index

```haskell
"Steve Buscemi" !! 6  -> 'B'  
```
