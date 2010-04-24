set :application, "testapp"
set :repository,  "git@github.com:FlintyV/TestApp.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "newsspawn.com"                          # Your HTTP server, Apache/etc
role :app, "newsspawn.com"                          # This may be the same as your `Web` server
role :db,  "newsspawn.com", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"


###

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :scm_passphrase, "appleseed" #This is your custom users password
set :user, "deployer"
set :deploy_to, "/var/www/watchplaygame.com"
set :branch, "master"
###

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end

