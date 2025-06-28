# Project Today Manager

![project image](images/project.png)

**About**

This is a CLI tool designed to help manage daily activities using a GTD (Getting Things Done) workflow implemented in the file system. The `today` script provides a comprehensive project management system with three main components:

- **Projects**: Manage your project portfolio with listing and creation capabilities
- **Scheduled**: Schedule projects with flexible timing options (dates, daily, weekday, weekend, specific days)
- **Today**: Manage your current day's active projects and tasks

The script supports various scheduling patterns including ISO dates (YYYY-MM-DD), recurring schedules (daily, weekday, weekend), and specific day abbreviations (mon,tue,wed,thu,fri,sat,sun). It automatically processes scheduled items and moves them to today's active list based on the scheduling criteria.

**Advantages:**

* Development Flux and Environment seamlessly integrated.
* Supports for Mac.
* Object-Oriented bash style
* Flexible scheduling with multiple time patterns
* Automatic daily processing of scheduled items
* File system-based workflow for transparency and portability

See examples of use below:

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

Today $ tds
Scheduled $ tdsl
Scheduled $ tdsi duolingo daily
Scheduled $ tdsl
Scheduled $ 1 2025-06-28 duolingo
Scheduled $ tdyia
Scheduled $ tdyl
:
1 2025-06-28 duolingo
2 2022-01-07 project-puppet-postgresql-upgrade
```

```mermaid
flowchart TD
  classDef hand stroke-dasharray: 4 4
  classDef scheduled fill:#e1f5fe
  classDef today fill:#f3e5f5
  classDef projects fill:#e8f5e8

  subgraph "Projects Management" 
    A[tdpl<br/>list projects]
    B[tdpn<br/>new project]
    C{"Select project"}
    A -->|list| C
    B -->|create| C
  end

  subgraph "Scheduling System"
    D[tdsi project tags<br/>schedule project]
    E[tdsl<br/>list scheduled]
    F[tdyia<br/>process scheduled→today]
    G{"Schedule Types:<br/>• YYYY-MM-DD<br/>• daily/weekday/weekend<br/>• mon,tue,wed,thu,fri,sat,sun"}
    C -->|schedule| D
    D -->|validate| G
    G -->|store| E
    E -->|auto-process| F
  end

  subgraph "Today Workflow"
    H[tdyl<br/>list today's tasks]
    I[tdyj N<br/>jump to project N]
    J[tdy<br/>open Today directory]
    K[tdye project<br/>end task]
    L[tdya<br/>archive today]
    F -->|populate| H
    H -->|navigate| I
    H -->|manage| J
    I -->|complete| K
    K -->|update| H
    H -->|organize| L
  end

  subgraph "Daily Automation"
    M[Recurring Schedules<br/>remain active]
    N[Date-based Schedules<br/>auto-removed]
    F -->|daily| M
    F -->|expired| N
  end

  START((Start)) -->|begin| A
  L -->|cycle| START
  K -->|continue| H

  class A,B,C,D,E,F,G,H,I,J,K,L,M,N,START hand
  class D,E,F,G,M,N scheduled
  class H,I,J,K,L today
  class A,B,C projects
```

**For further help:**

```shell
Crafted (c) 2025 by Zoatworks - We are stronger together 
Today v1.0.3

today [archive|end|help|init|list|setup|version]
      [projects [help|list|new]]
      [scheduled [archive|end|help|init|list|today]]

aliases
  alias tdp='_projects'
  alias tdpl='_projects.list'
  alias tdpn='_projects.new'
  alias tds='_scheduled'
  alias tdsa='_scheduled.archive'
  alias tdse='_scheduled.end'
  alias tdsea='_scheduled.end.all'
  alias tdsi='_scheduled.init'
  alias tdsj='_scheduled.jump'
  alias tdsl='_scheduled.list'
  alias tdy='today'
  alias tdya='today.archive'
  alias tdye='today.end'
  alias tdyea='today.end.all'
  alias tdyi='today.init'
  alias tdyia='_scheduled.today'
  alias tdyj='today.jump'
  alias tdyl='today.list'      

homepage https://github.com/enogrob/project-today-manager
```
**Installation**

```shell
pushd /tmp
git clone git@github.com:enogrob/project-today-manager.git
source ./project-today-manager/today
mv project-today-manager ~/Projects
echo "test -f ~/Projects/project-today-manager/today && source ~/Projects/project-today-manager/today" >> ~/.zshrc
source ~/.zshrc
popd
```

**Changes log**

* **1.0.0** Initial version.
* **1.0.1** `_projects.new` is working as expected.
* **1.0.2** `today.archive` corrected and `today.end.all` designed.
* **1.0.3** `_scheduled.init` and `_scheduled.today` refactored.

**Refs:**
* **[]()**

