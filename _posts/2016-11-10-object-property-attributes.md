---
layout: post
title: Object Property Attrubutes
comments : true
---

# Object Property Attributes in Js

| attribute name | meaning                                  |
| ------------------ | ---------------------------------------- |
| **value**          | The property's value.                    |
| **writable**       | `true` or `false`. Whether the property's value can be written to. (For example, `o["p"] = 1`) |
| **enumerable**     | `true` or `false`. Whether the property shows in some loop constructs, such as `for (var x in o) {…}` and `Object.keys(o)`. |
| **configurable**   | `true` or `false`. Whether the property can be deleted (For example, `delete o["p"]`) and whether its attributes can be changed. |