---
layout: post
title: All about Git
category : 'git'
---

Version control is a must for any developer. What is version control? Basically its a system that keep track of changes in files. For Example you and your colleagues are working on a project. You will be writing new functionalities, modifying existing code and if it all get saved to some common place, what are the chances that one's changes will not be overwritten by others.  You changed couple of file to test a new funcitonality but you didn't like you have to revert your changes. All these are difficult with normal methods.  There comes version control.

There are multiple systems to do version control. Famous one is Git.  When I started using Git I couldn't wrap my head around about these different commands that we have to use to just update some changes. But once I got to know them it made my life so much easier. So Let me explain what I know here in a very simple manner. But before that Let me clarify something.

 > `Git` is a version control system

 > `GitHub` is a web based Git repository hosting service. So it helps in saving our code
 in a server and gives us all the tasks for a proper version control. Another example is `Bitbucket`.

So even if you have an account in github or bitbucket we use the git protocol to do version control. You can even setup your own server as git a repository server and save your changes there.

## Installing git.

If you are using linux just run the following command
{% highlight bash %}
sudo apt-get install git
{% endhighlight %}

this will install git software in your system. Now you can run all git commands.
## How to use.

Let's start with creating a repo. You can go to github and [create a new repo](https://github.com/new).  you can choose a name. and after creating github will git you a url which will be where your files will reside and all the version control activities are done through that endpoint.

### Cloning
So we have a remote location to store our files. Now lets make a copy if that in you system. So that we can change files and save. Making a copy of an exising repo in to your system is called `cloning`. Command for cloing looks like this.

{% highlight bash %}
git clone https://github.com/username/repo-name.git
{% endhighlight %}

this will download the files in the repo and create a folder `repo-name` and save their.  Now this folder is tracked by git.  you can see `.git` folder inside which will have all our meta information we discussed earlier.

### Setting remote

What if you already had your files in local and you want push them to the new repo? All you have to do is initialise a git repo in your local folder and tell git to point to the repo url we got from github. These location where we store our files are called `remote`. The command looks like this, run it inside your project folder.

{% highlight bash %}
git init

git remote add origin https://github.com/username/repo-name.git
{% endhighlight %}

Now we have a git tracked folder in our system. Did you notice `origin` in the command?
Ok, This will be our nickname for the big url github gave us. We will be saving or getting files from gihub with this nick name. easy right?

You can also change the remote of an existing repo in your system.
{% highlight bash %}
git remote set-url origin https://github.com/username/repo-name.git
{% endhighlight %}

### Saving Changes

So we have a repo in our hand which tracks all our changes. Now the real use of version control. If you make changes to files. Git will tell you what all the lines you added,removed,modified. This is called diff of your changes. How will you see them? After making changes enter the following in the terminal from your project directory

{% highlight bash %}
git status
{% endhighlight %}

it will show you the different files you modified.  Now if you want those changes we have to `push` them to github.com (which is our remote answers by the name origin).
first command is `add`

{% highlight bash %}
git add filename
{% endhighlight %}

if you do git status again you can see that the added file is under a different heading. Now this files are `staged`. You can add the files, which have the changes you want to be saved and ignore the other files with the following command

{% highlight bash %}
git checkout -- otherfile
{% endhighlight %}

this will reset the changes did to that file. After adding all the files you want. You have to commit this changes.  Commit is basically taking all these changes that you added and giving it a unique id and message so that others can understand why you made those changes. These messages that we give has to be meaningful for others to understand.

{% highlight bash %}
git commit -m "a good meaningful message about what you did in this commit"
{% endhighlight %}

You can go ahead and make other changes, add & commit them. Please don't commit everything in one single commit. Make small independent changes into commits. Becuase we need them later.

These committed changes are stil in your system. To save it in to the server we have to `push` them to the remote.

{% highlight bash %}
git push origin master
{% endhighlight %}

Your changes are saved in the server. You can go to github and see your changes there.
Similarly to get others chnages you can do

{% highlight bash %}
git pull origin master
{% endhighlight %}



### Branches

When pushing the code we have to specify which branch to push to. Notice the `master` in the above command. master is the branch. Branches are ways to work with different versions of our code. While working on the project, we can create new branches from our main branch to work seperatly. When creating a branch we will get a copy of the files in the main branch, but that point onwards our changes that we make will not affect the main branch. Later once the changes are done branches can be merged. By default Github gives you the master branch.

{% highlight bash %}
git branch
{% endhighlight %}

You can see the branches in your system. current branch will have * next to its name.
You are in master branch and you have to create a new branch.

{% highlight bash %}
git checkout -b newbranch
{% endhighlight %}

this will create you a new branch which will have all the changes that are there in the current branch(master). Git will automatically switch you to that branch also.
Here you can make your changes and push to this branch

{% highlight bash %}
git add file
git commit -m "Changes" # example of unhelpful message
git push origin newbranch
{% endhighlight %}

But you sepearted from you main branch. How will you keep your new branch updated with the main branch

{% highlight bash %}
git pull origin master
{% endhighlight %}

This will get you the changes that are in master branch, which are not yet in your branch and save them to you branch in your system again you have to push these changes to make it persistent. You can also do the following operations with branches

{% highlight bash %}
git checkout development # to switch to a different branch

git branch -D development # delete the branch in you local system( wont affect remote)

git push origin :development # delete branch from remote

git merge master  # merges the changes master to you current branch

{% endhighlight %}

NB: when you checkout your commited changed will stay in the previous branch, but uncommited changed will come to the checkedout branch

### Merge Conflicts

When multiple developers working in the same file can create problems.  Normally when you pull or merge branches git automatically merges your changes. But when git detect more than one user has changed same lines in a files it get confused about which one we actually need so it raises merge conflicts. It will look like following.

{% highlight diff %}
<<<<HEAD
    your changes
========
    someone else's change
>>>>adef5656
{% endhighlight %}

This is git's way of asking which one do you want. Merge conflicts will stop the pull/merge operation mid way. We have to resolve the conflict (remove those head,==,tails from the code) and stage and commit the changes to continue. You have to check the code and decide what should be the final and commit them.

### HEAD, checkout
When we commit changes, it get a unique Id known as `commit Id` which is a reference point for our changes. HEAD in the above section is actually a pointer to such a commit id which will be the last commit we did in the current branch.

Using these commit Ids you can goto any commits you want, you can find these commit Ids with the help of logs, copy the big number that will be your commit id

{% highlight bash %}
git log
git checkout *commit-id*
{% endhighlight %}

it will take you to that commit.

### Reverting your changes.

Another advantage of git is that you can revert your changes pretty easy. Remmember we discussed about commits. If our commits have only related changes we can revert a whole commit. So the changes we did will be reverted

{% highlight bash %}
git revert *commit-id*
{% endhighlight %}

If you want a to reset a series of commit that you did last, you can even reset a branch to a different commit you want.

{% highlight bash %}
git reset *commit-id*
{% endhighlight %}

The above command will reset your commit till the mentioned commit. And you have all those changes you did in the reseted commits will be in your directory in uncommited state.

Let say if you dont want those changes, following will reset as well as clean those changes.

{% highlight bash %}
git reset --hard *commit-id*
{% endhighlight %}

NB: all these are in your local system, If you want them to persist you have to push them to remote
