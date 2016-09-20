---
layout: post
title: Ubuntu Easy Install
comments : true
---

I am using ubuntu for some time now. I still have my Ubuntu 10.04 CD sent by
ubuntu team for free. Every April & November we get a new version of Ubuntu.  I prefer to do
a fresh install everytime which means loosing application that are installed. Here is an easy way to install
all your favourite apps back.

### The Install script

You can make a list of all the softwares you want to install into a text file. If its an application
available within ubuntu you can add
{% highlight bash %}
sudo apt install -y app-name1 app-name2
{% endhighlight %}
to your script file. If it is not supported by ubuntu, If it is given by a third party ppa. Add its details
in to the file. For Example to install sublime editor you need in add its ppa to your source, add it as follows
{% highlight bash %}
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
{% endhighlight %}
> don't forget to add `-y` to all these commands. So it wont wait for  user confirmation

if you are web developer who uses node. You can even install you global npm packages. Add them also to the list
{% highlight bash %}
sudo npm -g install babel-cli bower gulp
{% endhighlight %}
if you use atom all your extension can be added using `apm`. Add them also to the list
{% highlight bash %}
apm install eslint
{% endhighlight %}
### Saving the script

You can save this file and execute it every time you install ubuntu. But keeping a file, Downloading it everytime, then changing its permission and running, it is difficult. So here is another way. Save the file, Push to one of your git repo. In github you can get its
raw url which is a url to the actual file. When you access that url you will get the file. Again that is a long url, How will you remember it? [bit.ly](https://bit.ly) to your rescue. Bit.ly is a url shortening service. If you give a big url it can give you a small url. We can even customise the url if you login. So we can convert our big url into something meaningful.

### Using the Script

Now our list is saved in a url. How will you use that? After installing ubuntu run the following command.
{% highlight bash %}
curl -L your-url | bash -
{% endhighlight %}
This will download the file and execute it in your system. It may take sometime depending on your internet & system. But you don't have to
be there. Let it install. [-L](https://curl.haxx.se/docs/manpage.html#-L) in the command will help in redirecting our call from bit.ly to gihub. Checkout a similar script file I use for installation

> [https://bit.ly/sv-install-ubuntu](https://bit.ly/sv-install-ubuntu)
