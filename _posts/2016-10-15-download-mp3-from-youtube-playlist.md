---
layout: post
title: Download MP3 from youtube playlist
comments : true

---

youtube-dl is a cli tool to download videos from video sharing website. If you like a playlist
and want to listen to it on your phone as mp3. You can use the following command to download the
mp3 from the playlist.
### Install youtube-dl

{% highlight bash %}
sudo apt install -y youtube-dl
{% endhighlight %}

### Find the url & download

If you want to download a playlist, look for a url which have `list=somelongnumber` and use the below command

{% highlight bash %}
youtube-dl --extract-audio --audio-format mp3 <url to playlist>
{% endhighlight %}
