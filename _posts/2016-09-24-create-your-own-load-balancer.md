---
layout: post
title: Create your own load balancer
comments : true
category : 'server'
---

If you have a server running for you apps. It is always better to run a backup server incase something happended to you main server.
It always a good Idea to run a minimum of two servers. So that load can be distributed across the servers and incase if one goes down the other
will be able to serve the requests.  Even deployments can be done in rolling manner without any down time. Here is how I set up my own Load balancer to
route traffic to multiple servers.  I have started to do this because websockets were not working behind an aws load balancer.  But that can be solved
by using application load balancer.  But if you are not using aws, and want to setup a load balancer. Here is how its done.

### Installing nginx

This load balancer is basically an nginx server. So our calls will reach this nginx server which will route it to one of the servers which is configured in it.
Start with installing  nginx.

{% highlight sh %}
sudo apt install nginx
{% endhighlight%}


this will install nginx and a basic configuration.

### Nginx configuration
Depending upon our domain (example.com) with which we access, create the following files,
{% highlight bash%}
sudo nano /etc/nginx/site-available/example.com
{% endhighlight%}

this is the configuration file for example.com.  So when we point example.com to this server using your DNS manager. It will check this file.
add the folloeing config to the above file.

{% highlight nginx %}
upstream example {
    server server1_ip;
    server server2_ip;
}

server {
	server_name example.com;
	listen  80;
    location / {
        proxy_pass http://example;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

}

{% endhighlight%}

this will create a server which listens on port 80. and pass all the request to either
servers specified in upstream.

### Enabling secure connection (https)
you can also make your load balancer to host ssl cetificates. So that your individual servers need not start https traffic.
change the above config to support https as well.

{% highlight nginx %}
upstream example {
    server server1_ip;
    server server2_ip;
}

server {
  server_name example.com;
  listen  80;
  listen  443 ssl;
  ssl on;
  ssl_certificate /etc/nginx/ssl/example.com/server.cer;
  ssl_certificate_key /etc/nginx/ssl/example.com/server.key;

    location / {
        proxy_pass http://example;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

}

{% endhighlight%}

server.cer,server.key are the certificate files for your domain. Getting it form your ssl provider.
So now you can point your dns to your load balancer. It will redirect your request any one of the server.

### Enabling websocket communication

  Aws Classic load balancer doesn't support Web socket communication. If you want to enable web socket connections you have to pass couple of headers
  to our server. Change our config as follows to support web socket communication.
  {% highlight nginx %}
  upstream example {
      server server1_ip;
      server server2_ip;
  }

  server {
  	server_name example.com;
  	listen  80;
    listen   443 ssl;
    ssl on;
    ssl_certificate /etc/nginx/ssl/example.com/server.cer;
    ssl_certificate_key /etc/nginx/ssl/example.com/server.key;

      location / {
          proxy_pass http://example;
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;       
          proxy_http_version 1.1;
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection "upgrade";
      }

  }

  {% endhighlight%}

### Enabling the new site

Site configuration files are availble in `/etc/nginx/sites-available`, but active sites are available inside
`/etc/nginx/sites-enabled` so we have to create a symlink inside this folder to activate our site.

{% highlight bash%}
sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/example.com
{% endhighlight%}

After configuration, restart nginx service to make the changes.
{% highlight bash%}
sudo service nginx restart
{% endhighlight%}

### errors

If you are working with websockets you may get an error as follows
{% highlight bash%}
Unable to establish connection 400 Bad Request,
{% endhighlight%}

you can try configuring your load balancer as above.  Normal load balancer will not forward
`Connection : upgrade` header. which will block establishing socket connections.
