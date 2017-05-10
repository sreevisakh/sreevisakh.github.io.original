---
layout: post
title: Bumping Package Versions
category : 'webpack'
---

If you are using webpack for build you can a the following plugin to increase the version in your package.json file

https://www.npmjs.com/package/bump-webpack-plugin



Add a deploy script to push a tag with the new version, You will get releases in your git hub repo

```js
function deploy(){
  let options = {
    cwd: path.resolve(__dirname)
  };
  //commit version bump in main repo
  spawnSync('git',['reset','HEAD'],options);
  spawnSync('git',['add','package.json'],options);
  spawnSync('git',['tag',version],options);
  spawnSync('git',['commit','-m',`Release:${version}`],options);
  spawnSync('git',['push','origin','master','--tags'],options);
}
```

Above piece of code will add your `package.json` and create commit & tag and push them your repo.
