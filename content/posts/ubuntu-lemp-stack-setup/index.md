---
title: "Setting Up a LEMP Stack on Ubuntu"
date: 2024-03-21
description: "Learn how to install and configure a LEMP (Linux, Nginx, MySQL, PHP) stack on Ubuntu for hosting web applications."
summary: "This guide provides step-by-step instructions for setting up a LEMP stack on Ubuntu, including installing Nginx, MySQL, and PHP, along with configuring the necessary server blocks and PHP settings."
tags: ['Ubuntu', 'LEMP', 'Nginx', 'MySQL', 'PHP', 'Web Hosting']
aliases:
  - /ubuntu-lemp-stack-setup/
---

## Introduction to LEMP Stack

LEMP is a popular web development stack that consists of the following components:

- **Linux**: The operating system.
- **Nginx**: The web server.
- **MySQL**: The database management system.
- **PHP**: The server-side scripting language.

This guide focuses on setting up a LEMP stack on Ubuntu.

### 1. Installing Nginx

Nginx is a high-performance web server that will serve as the backbone of our LEMP stack. Install Nginx using the following command:

```bash
user@machine:~$ sudo apt install nginx
```

After installation, ensure that the Nginx service is started and enabled so it will start on boot:

```bash
user@machine:~$ sudo systemctl start nginx
user@machine:~$ sudo systemctl enable nginx
```

Create directory to store site files, in this case for `example.com`:

```bash
user@machine:~$ sudo mkdir /var/www/example.com
```

### 2. Installing MySQL

MySQL is a powerful relational database management system. Install MySQL server using the following command:

```bash
user@machine:~$ sudo apt install mysql-server
```

Once installed, run the MySQL security script to secure your installation. Follow the prompts to set a root password and configure other security options:

```bash
user@machine:~$ sudo mysql_secure_installation
```

After installation, ensure that mysql service is started and enabled:

```bash
user@machine:~$ sudo systemctl start mysql
user@machine:~$ sudo systemctl enable mysql
```


### 3. Installing PHP

PHP is a popular server-side scripting language used for dynamic web content. Install PHP along with necessary extensions:

```bash
user@machine:~$ sudo apt install php-fpm php-mysql
```

### 4. Configuring Nginx to Use PHP

Next, configure Nginx to process PHP files. Create a new server block configuration file for your website:

```bash
user@machine:~$ sudo nano /etc/nginx/sites-available/example.com
```

Replace `example.com` with your domain name. Paste the following configuration into the file:

```nginx
server {
    listen 80;
    server_name example.com www.example.com;
    root /var/www/example.com;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}
```

Save and close the file. Then, create a symbolic link to enable the new site configuration and unlink the default site to disable it:

```bash
user@machine:~$ sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/
user@machine:~$ sudo unlink /etc/nginx/sites-enabled/default
```


### 5. Create an Example Index

Create an `index.php` which will display your PHP details.  This is useful as it will give nginx something to load as well as making sure that PHP is being processed:

```bash
user@machine:~$ sudo nano /var/www/example.com/index.php
```

```php
<?php
phpinfo();
?>
```


### 6. Testing Configuration and Restarting Nginx

Test the Nginx configuration for syntax errors:

```bash
user@machine:~$ sudo nginx -t
```

If no errors are reported, restart Nginx to apply the changes:

```bash
user@machine:~$ sudo systemctl restart nginx
```


Depending on your setup you should now be able to access `http://example.com`, `http://127.0.0.1`, or `http://server_ip_address` in your web browser. If everything worked correctly you should see the PHP information page.


### Conclusion

You have successfully set up a LEMP stack on your Ubuntu server. You can now deploy and host your web applications using Nginx, MySQL, and PHP, taking advantage of the robust and efficient LEMP stack for web development.
