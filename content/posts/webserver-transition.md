---
title: "Web-Server Transition"
date: 2019-04-08T23:59:00+02:00
draft: false
categories: [www]
tags: [centos, apache mariadb]
---

Several years the [kate-editor.org](https://kate-editor.org) & [cullmann.io](https://cullmann.io) pages got hosted on a [Hetzner](https://www.hetzner.de/) root server.
To reduce costs and switch away from old hardware they got now moved to an [OpenVZ](https://openvz.org/) based virtual server at [Host Europe](https://www.hosteurope.de).

On both servers [CentOS](https://centos.org) 7.x is running, it did always provide a stable foundation for the services these sites use.

As with any server move in the past, I always need to search how to best move the data/config from one server to the other.
To document this for me and others, here the quick way to move the basic things needed for web services using just plain [Apache](https://httpd.apache.org/) & [MariaDB](https://mariadb.org/).

The following steps assume you have installed the same packages on both machines and the new machine is allowed to ssh as root to the old one.
If you have non-system users, you should create them with the same ids as on the old server.

For the following shell commands, the old server address is $SERV and the MariaDB root password is $PASS on both machines.
Best use the raw IP as address if you are in parallel updating your DNS entries to avoid confusion (and wrong syncs).

**Attention: Wrong syncing of stuff can have disastrous consequences! Check all commands again before executing them, don't trust random people like me without verification!**

* sync your data, assuming it is in /home and /srv/(ftp/www)

> rsync --delete -av root@$SERV:/home/ /home<br>
> rsync --delete -av root@$SERV:/srv/ftp /srv<br>
> rsync --delete -av root@$SERV:/srv/www /srv<br>

* transfer your databases

> ssh root@$SERV "mysqldump -u root -p$PASS --all-databases > /root/db.sql"<br>
> scp root@$SERV:/root/db.sql /root/<br>
> mysql -u root -p$PASS < /root/db.sql<br>

* sync configs (you might need more, this is just apache & vsftp)

> rsync --delete -av root@$SERV:/etc/httpd /etc<br>
> rsync --delete -av root@$SERV:/etc/letsencrypt /etc<br>
> rsync --delete -av root@$SERV:/etc/vsftpd /etc<br>

* get crontabs over for later re-use, store them in the root home

> rsync --delete -av root@$SERV:/var/spool/cron /root

Now all things should be there and after some service restarts e.g. [WordPress](https://wordpress.org/) powered pages should be up-and-running again.

I hope this short how-to helps others and allows me to avoid searching stuff in the future once again from scratch.
