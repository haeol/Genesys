### Git usage

*..Clone..*
> git clone https://github.com/aniquedavla/Tea.git

*..Make all changes in a branch; not on master; to make a branch…*
> git branch new_branch <br/>
> git checkout new_branch (this will switch to your new branch)

*… you do some work …*
> git add . (add every change to the commit) <br/>
> git commit -m “This is the work I did!” (describe your changes)<br/>
> git push origin branch_i_am_on (upload it to the server)<br/>

*…once we finialize on your changes, push to master…*
> git status <- see the files that you made changes to; file name should be highlighted in red <br/>
> git add <file name that you made changes to> (don't stage all your files to commit..add only the file you made changes to)</br>
> git commit -m “This is the work I did!” (describe your changes)<br/>
> git push origin master (upload it to master branch)<br/>

*…if you want to update from master; usually after you merge something to master…*
> git pull origin master <- download changes in master<br/>
> git merge master <- combine your branch with the master.<br/>
