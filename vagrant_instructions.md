1. Download package.box
2. In console, go to IDCD app folder `cd path\to\idcd`
3. In console, type `vagrant box add idcd_box /path/to/your/downloaded/package.box` changing out the path to suit where you put your box file
4. In console, type `vagrant init idcd_box`
5. Now you can do a `vagrant up` and `vagrant ssh`
6. From inside vagrant, do `cd /vagrant` and now you can test locally using `rails s` and the like