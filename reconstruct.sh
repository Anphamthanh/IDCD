git pull
sudo service httpd stop
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake assets:precompile
sudo service httpd start
