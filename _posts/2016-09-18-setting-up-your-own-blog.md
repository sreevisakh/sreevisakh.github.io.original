---
layout: post
title: Setting up your own Blog
---

I am a web developer working in a startup.  I get to work with variety of problems day to day.  That is the benefit of being in a startup, you get to work with everything that you want to build.  There can be situations you have to spent hours in reasearch to find a possible solution.  The solutions will always come as either a stackoverflow answer or some good guy wrote a blog about it after he faced the same problem.  It is always good to give back to the community.  That is the reason I started myself with this blog. I got the inspiration form a post I read in Medium.

So I setup this blog.  This uses jekyll, An easy way to setup your blog in less than 10 minutes.  I have to look at multiple documents to set it up fully.  So I thought I will write the problems I faced while installing this.   Basically Jekyll is a static website generator.   You can write to posts in markdown or html and no need to worry about how to set up pages, archives, tags, or hosting. Here is How I did it.

### Install Jekyll in your system.
{% highlight bash %}
gem install jekyll bundler
jekyll new my-blog
cd my-blog
bundle install
jekyll serve
{% endhighlight %}

the above commands will install jekyll in your system together with bundler, helps you create a new blog. and lets you run it. Once you do serve you can open the browser and see you blog

if you ran into errors on your console like I got into, and if it says about missing packages install them using gem
eg : `gem install redcarpet`

### Make it look good with themes
You can select a theme for your blog as well.  There are a lot of themes out there in the internet select from among them. You can follow the instructions on how to install them. I am using Hyde theme, which only need to copy the file to the respective folders.

### About Jekyll Directory Structure
You will see multiple folders in you blog directory, folders you want to checkout are

 - _posts : which will have your posts with `yyyy-mm-dd-name.md` as filename
 - _drafts : incomplete posts
 - _layouts : structure of your page, go through to find the structure of your pages
 - _includes : various components of your blog.
 - _site : where jekyll generates your blog.

there are couple of files as well

 - about.md this is your about file. you can change it to your details
 - _config.yml this is your configuration for jekyll, you can setup variables,dependencies,site details, which you can use throughout the blog.

### First post
  Create your first post by adding a file to the `_posts` folder following the naming convention `yyyy-mm-dd-name.md`. Add the following to the starting to recognise it as a post for the jekyll

<pre>
 ---
 layout: post
 title: Setting up your own Blog
 ---
</pre>

if your are running `jekyll serve --watch`  you can refresh and see the changes in the browser

### Hosting your Blog
  There are multiple ways for hosting this blog.  I am going to tell the easiest & free of all `Github Pages`.  Github Pages provides you with free hosting as well as version control for your blogs.

  There are two ways you can do this.  You can make this part of your existing repo.  For Example, you have a repo `my-awesome-project` and you want to write docs for this project and host it in my-awesome-project/docs. All you have to do is push all these files into a branch 'gh-pages', Github will automatically detect jekyll and it will show you the blog. You can configure the rest in GitHub Settings page for your repo.

  But what if we need to host our personal blog not docs. For that you have to [create a new repo](https://github.com/new) called `yourname.github.io` and push all files to it and access your blog using [https://yourname.github.io], again change configuration in Github Repo Settings page.

  Thats it!, you hosted your blog. Do some changes and improve them by adding sitemap, adding tags, give a proper url for your blog, which will help improve search experience for your pages and help it reach more users.
