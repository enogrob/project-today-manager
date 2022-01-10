```
Roberto Nogueira  
BSd EE, MSd CE
Solution Integrator Experienced - Certified by Ericsson
```
# Project Today Manager

![project image](images/project.png)

**About**

This is in order to help the working CLI daily activities. It implements the [Getting Things Done(GTD)](https://www.amazon.com/gp/product/B000WH7PKY) process flow in the underlying file system.


**Advantages:**

* [Getting Things Done(GTD)](https://www.amazon.com/gp/product/B000WH7PKY) Development Flux and Environment seamlessly integrated.
* Supports for Linux(Ubuntu).
* Object-Oriented bash style

See example of use below:

```shell
$ tdpl
:
tutorial-building-debian

$ tdyi tutorial-building-debian
$ tdyl
:
1 2022-01-07 tutorial-building-debian
2 2022-01-07 project-puppet-postgresql-upgrade

$ tdyj 1
:
tutorial-building-debian $ tdy

Today $ tdye tutorial-building-debian
Today $ tdyl
:
2 2022-01-07 project-puppet-postgresql-upgrade

Today $ tdll
:
2022-01-09_2329-tutorial-building-debian
```

![](images/gtd-5.png)

**Requirements and Tips**

In order to install `Today Manager`, it is required that the following has been installed already:

* [tree](http://manpages.ubuntu.com/manpages/trusty/man1/tree.1.html) for installing do `sudo apt install tree`.

**For further help:**

```shell
Crafted (c) 2021 by Daitanlabs - We are stronger together 
Today v1.0.1

today [end|help|init|list|setup|version]
      [inbox [collect|help|list]]
      [logbook [help|list]]
      [projects [help|list|new]]
      [scheduled [end|help|init|list|today]]
      [someday [end|help|init|list|today]]

aliases
  alias tdg='today.git.status'
  alias tdge='today.git.end'
  alias tdgi='today.git.init'
  alias tdgl='today.git.log'
  alias tdi='_inbox'
  alias tdic='_inbox.collect'
  alias tdil='_inbox.list'
  alias tdl='_logbook'
  alias tdll='_logbook.list'
  alias tdp='_projects'
  alias tdpl='_projects.list'
  alias tdpn='_projects.new'
  alias tds='_scheduled'
  alias tdsd='_someday'
  alias tdsde='_someday.end'
  alias tdsdi='_someday.init'
  alias tdsdj='_someday.jump'
  alias tdsdl='_someday.list'
  alias tdsdt='_someday.today'
  alias tdse='_scheduled.end'
  alias tdsi='_scheduled.init'
  alias tdsj='_scheduled.jump'
  alias tdsl='_scheduled.list'
  alias tdst='_scheduled.today'
  alias tdy='today'
  alias tdye='today.end'
  alias tdyi='today.init'
  alias tdyj='today.jump'
  alias tdyl='today.list'      

homepage http://bitbucket.wrs.com/users/rmartins/repos/project-today-manager
```
**Installation**

```shell
pushd /tmp
git clone git@github.com:enogrob/project-today-manager.git
source ./project-today-manager/today
mv project-today-manager ~/Projects
echo "test -f ~/Projects/project-today-manager/today && source ~/Projects/project-today-manager/today" >> ~/.bashrc
source ~/.bashrc
popd
```

**Changes log**

* **1.0.1** Improve `today.print` and `today.setup` in order to handle scheduled projects.
* **1.0.0** Initial version.

**Refs:**
* **[ Getting Things Done: The Art of Stress-Free Productivity](https://www.amazon.com/gp/product/B000WH7PKY)**

