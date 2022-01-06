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
$ today
:
~/Today $
```

![](images/gtd-5.png)

**Requirements and Tips**

In order to install `Today Manager`, it is required that the following has been installed already:

* [tree](http://manpages.ubuntu.com/manpages/trusty/man1/tree.1.html) for installing do `sudo apt install tree`.

**For further help:**

```shell
Crafted (c) 2021 by Daitanlabs - We are stronger together 
Today v1.0.07

today [end|help|init|list|setup|version]
      [inbox [collect|help|list]]
      [logbook [help|list]]
      [projects [help|list|new]]
      [scheduled [end|help|init|list|today]]
      [someday [end|help|init|list|today]]

homepage http://bitbucket.wrs.com/users/rmartins/repos/project-today-manager
```
**Installation**

```shell
pushd /tmp
git clone git@github.com:enogrob/project-today-manager.git
source ./project-today-manager/today
mv project-today-manager ~/Today
echo "test -f ~/Projects/project-today-manager/today && source ~/Projects/project-today-manager/today" >> ~/.bashrc
source ~/.bashrc
popd
```

**Changes log**

* **1.0.0** Initial version.

**Refs:
* **[ Getting Things Done: The Art of Stress-Free Productivity](https://www.amazon.com/gp/product/B000WH7PKY)**

