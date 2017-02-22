### Git usage

*..Clone..*
> git clone https://github.com/haeol/Genesys

*..Make a branch…*
> git branch new_branch <br/>
> git checkout new_branch (this will switch to your new branch)
> git branch (this will check your current branch)

*… you do some work on your branch…*
> RAILS_ENV=production bundle exec rake assets:precompile
> git add . (add every change to the commit) <br/>
> git commit -m “This is the work I did!” (describe your changes)<br/>
> git push origin branch_i_am_on (upload it to the server)<br/>

*…once we finialize on your changes, push to master…*
> git status (see the files that you made changes to; file name should be highlighted in red) <br/>
> git add <file name that you made changes to> (don't stage all your files to commit..add only the file you made changes to)</br>
> git commit -m “This is the work I did!” (describe your changes)<br/>
> git push origin master (upload it to master branch)<br/>

*…if you want to update from master; usually after you merge something to master…*
> git pull origin master (download changes in master)<br/>
> git merge master (combine your branch with the master)<br/>

*..configuring postgres..*
> pg_ctl -D /user/local/var/postgres -l /usr/local/var/postgres/server.log start (start the server) <br/>
> createuser -s -r genesys (create a user for postgres named genesys, don't change the name) <br/>
> rake db:create:all (if db is not yet created) <br/>
> rake db:migrate    (if db is already created) <br/>
> rails s            (should now work) <br/>

*..using postgres..every time you start the server, you have to start postgres first..*
> pg_ctl -D /user/local/var/postgres -l /usr/local/var/postgres/server.log start (start the server) <br/>
> pg_ctl -D /user/local/var/postgres -l /usr/local/var/postgres/server.log stop  (stop the server) <br/>
