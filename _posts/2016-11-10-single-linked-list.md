---
layout: post
title: Algorithms in JS | Single Linked List
comments : true
---

```js
class Node{
  constructor(data){
    this.data = data;
    this.next = null;
  }
}

class SingleLinkedList{
  constructor(data){
    this.head = new Node(data);
  }
  
  insertAtEnd(data){
    var node = new Node(data);
    var tmp = this.head;
    while(tmp.next!==null){
      tmp = tmp.next;
    }
    tmp.next = node;
  }
  
  insertAtStart(data){
    var node = new Node(data);
    node.next = this.head;
    this.head = node;
  }
  
  insertAfterElement(data,after){
    var node = new Node(data);
    var tmp = this.head;
    while(tmp.next.data!=after && tmp.next.next !=null){
      tmp = tmp.next;
    }
    if(tmp.data === after){
      
    }
    
  }
  print(){
   var tmp = this.head;
   let string = '';
    while(tmp){
        string += tmp.data+'->'
        tmp = tmp.next;
    }
    string+='null';
    console.log(string);
  }
   
}

var sl = new SingleLinkedList(1);
[2,3,4,5,6,7,8,9].map(number => sl.insertAtEnd(number));
sl.print();

exports.SingleLinkedList;
```

