---
layout: post
title: "Recommended Way of adding multiple classes in css modules"
date: "2017-05-09 00:31:41 +0530"
---

When using css modules to import css into your js components, you can follow the following ways to add
multiple classes to the element.

```js
import styles from './style.css'
...
return <div classNames={[styles.btn, styles.btnPrimary, styles.pullRight].join(' ')} />
```
another approach is to use the `classnames` library

```js
import classNames from "classnames";
import styles from "./style.css";

let className = classNames(styles.btn, {
  [styles.primary]: this.props.primary,
  [styles.right]: this.props.right
});
return <div className={className} />
```
