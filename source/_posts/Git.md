---
title: Git
date: 2020-11-27 13:33:13
tags: [VersionControl]
categories: Computer Science
---
Git 是 Linus Torvalds 为了帮助管理 Linux 内核开发而开发的一个开放源码的版本控制软件。
- git help xxx
  - git help workflows
  - git help everyday
  - git help tutorial
  - git help revisions
- chmod -R u+w .git

# Config
- [global ignore](https://gist.github.com/subfuzion/db7f57fff2fb6998a16c)
  - `git config --global core.excludesfile ~/.gitignore`
  - e.g.
    ```
    target
    bin
    *.db
    ```
- git config --list 看所有用户
- proxy
  - git config --global --unset https.proxy
  - git config --global --unset http.proxy
  - git config --global http.proxy 'proxy.example.com:8080'
  - git config --global https.proxy 'socks5://127.0.0.1:1080'’
  - git config --global http.proxy http://proxy.example.com:8080
  - git config --global https.proxy http://proxy.example.com:8080
- `git config --global commit.template ~/commit_template.txt`


# Git命令状态图
## Workdspace
- git status -u(-uall) show all files untracked
- git clean -df 删除所有untracked的文件
- git ls-files 看已经被提交的
- `git update-index --assume-unchanged xx/xx/configuration.xml` ignore file
- init      Create an empty Git repository or reinitialize an existing one
  - git init
  - git init-db 则在当前目录中产生一个.git 的子目录。
  - 创建新git
    - mkdir WebApp
    - cd WebApp
    - git init
    - touch README
    - git add README
    - git commit -m 'first commit'
    - git remote add origin xxxx.git
    - git push -u origin master
- bisect    Use binary search to find the commit that introduced a bug
- diff      Show changes between commits, commit and working tree, etc
  - git diff --cached 
    - see what you’ve staged that will go into your next commit
  - git diff --cached 或 $ git diff --staged 查看尚未提交的更新
- grep      Print lines matching a pattern
- log       Show commit logs
  - git log -p ./manifest.yml
- show      Show various types of objects
- status    Show the working tree status
  - git status 查看当前状态
- blame 
  - git blame xx.java
    - git blame xx.xml -L 1 第一行开始
## Stash <-> Workspace 
- git stash list
- git stash push 将文件给push到一个临时空间中
- git stash pop 将文件从临时空间pop下来

## Workspace -> Staged
- git add [fileName | path]
  - git add .
  - git add --all
- mv        Move or rename a file, a directory, or a symlink
- restore   Restore working tree files
- rm        Remove files from the working tree and from the index
  - git rm a.a 移除文件(从暂存区和工作区中删除)
  - git rm --cached a.a 移除文件(只从暂存区中删除)
  - git rm -f a.a 强行移除修改后文件(从暂存区和工作区中删除)
  - git删除文件
    - rm add2.txt
    - git rm add2.txt
    - git commit -m "rm test"
    - git push web
  - at server
    - cd /var/www/foo.git;sudo git update-server-info
  - 检查删除效果
    - rm foo3 -rf
    - git clone xxx/foo.git foo3
  - 更新已经存在的local code
    - cd foo2
    - git remote add web [user]@[ip]:/var/www/foo.git/
    - git pull web master
## Staged -> Workspace
- git reset 撤销add
  - git reset HEAD [fileName] If no fileName, all staged files will be reset to untraced or not staged.
  - git reset head^
  - git reset --hard origin/master
## Staged -> Local Repo
- commit
  - git commit --amend
  - git commit -am "init" 提交并且加注释
  - git commit -a 
    - -a是代表all，把所有的change加到git index里然后再commit
    - -v 当你用－v参数的时候可以看commit的差异
    - -m "This is the message describing the commit" 添加commit信息
    - --amend
- branch
  - 查看本地分支：$ git branch
    - git branch -a 查看所有的分支
    - 查看远程分支：$ git branch -r
  - 创建本地分支：$ git branch [name] ----注意新分支创建后不会自动切换为当前分支
    - git branch branch_0.1 master 从主分支master创建branch_0.1分支
    - git branch -m branch_0.1 branch_1.0 将branch_0.1重命名为branch_1.0
    - git branch --set-upstream-to=origin/master feature1
  - 切换分支：$ git checkout [name]
    - git checkout branch_1.0/master 切换到branch_1.0/master分支 
    - git checkout --track origin/dev 切换到远程dev分支
    - git checkout -b dev 建立一个新的本地分支dev
    - git checkout dev 切换到本地dev分支
    - git checkout xxx.java
    - `git checkout HEAD~2` current work point 向上移动2个提交
  - 删除分支：$ git branch -d [name]
    - -d选项只能删除已经参与了合并的分支，对于未有合并的分支是无法删除的。
    - -D force delete
      - git branch -D develop 删除本地库develop
- 创建空的分支：(执行命令之前记得先提交你当前分支的修改，否则会被强制删干净没得后悔)
    - $git symbolic-ref HEAD refs/heads/[name]
    - $rm .git/index
    - $git clean -fdx
- merge
  - git merge [name] ----将名称为[name]的分支与当前分支合并
  - git mergetool
  - 同一个分支提交起冲突的时
    - git add
    - git commit
    - git pull --rebase
    - 修改本地代码
    - git push
  - 不同分支提交冲突时
    - git add
    - git commit
    - git merge master(master分支合并到本地分支) 
    - 修改本地文件
    - git add
    - git commit
    - git push
  - 方案一
    1. updatea master to latest
      - git checkout master
      - git fetch origin
      - git pull --rebase
    2. update 冲突branch to master
      - git rebase master
    3. 解决冲突后
      - git add --all
      - git rebase --continue
      - git commit --amend
  - 方案二
    1. checout a new branch to latest 
      - git checkout -b merge1 origin/master 
      - git fetch origin 
      - git pull 
    2. update 冲突branch to the new branch 
      - git rebase merge1 
    3. 解决冲突后 
      - git add --all 
      - git rebase --continue 
      - git commit --amend
  

- [rebase Reapply commits on top of another base tip](https://blog.csdn.net/endlu/article/details/51605861)
  - git rebase -i HEAD~3
  - git rebase -i 3a4226b
  - git rebase -i origin/master
  - git rebase origin/master 
  - git rebase origin/master branchname
  - git rebase --continue
  - git rebase --skip
  - Squashing Your Commits
    - `git rebase -i HEAD~3` This will bring you into your editor with some text that will look something like this:
      >pick df94881 Allow install to SD
      >pick a7323e5 README Junkyism
      >pick 3ead26f rm classpath from git
    - To squash those commits into one, change to something like this:
      >pick df94881 Allow install to SD
      >squash a7323e5 README Junkyism
      >squash 3ead26f rm classpath from git
    - Then, save/quit
- switch    Switch branches
- tag       Create, list, delete or verify a tag object signed with GPG
  - 查看版本：$ git tag
  - 创建版本：$ git tag [name]
  - 删除版本：$ git tag -d [name]
  - 查看远程版本：$ git tag -r
  - 创建带注释的tag：$ git tag -a [name] -m 'yourMessage'
- cherry-pick
  - git cherry-pick <commitid>

## Local Repo -> Remote Repo
- push      Update remote refs along with associated objects
  - git push [远程仓库名] [branchname] 将本地分支推送到服务器上去
    - git push origin master 将本地项目给提交到服务器中
    - git push origin test:master    提交本地test分支作为远程的master分支
      - 删除远程分支：git push origin :heads/[name] 或 git push origin :[name]
    - git push origin --delete feature/login 
    - 删除远程版本：git push origin :refs/tags/[name]
    - 上传本地tag到远程仓库：git push origin --tags
## Remote Repo -> Local Repo
- git clone xxxxxxx.git 从服务器上将代码给拉下来
- fetch     Download objects and refs from another repository
  - git fetch origin
  - git fetch -p origin
    - prune local "cache" of remote branches 
- pull      Fetch from and integrate with another repository or a local branch
  - 拉取远程仓库：$ git pull [remoteName] [localBranchName]
  - 合并远程仓库的tag到本地：$ git pull origin --tags
  - git pull -t
    - -t is pull tags 
## Remote Repo
- 查看远程仓库：$ git remote -v
- 添加远程仓库：$ git remote add [name] [url]
  - git remote add origin git@xxx.xxx.git
- 删除远程仓库：$ git remote rm [name]
- 修改远程仓库：$ git remote set-url --push [name] [newUrl]
- git remote show origin，显示远程库origin里的资源
  - git remote show 查看远程库
- git remote prune origin 删除本地缓存的远程分支，还你一个清晰的git branch -r：

# 子模块(submodule)相关操作命令
- 添加子模块：$ git submodule add [url] [path]
  - 如：$git submodule add git://github.com/soberh/ui-libs.git src/main/webapp/ui-libs
- 初始化子模块：$ git submodule init  ----只在首次检出仓库时运行一次就行
- 更新子模块：$ git submodule update ----每次更新或切换分支后都需要运行一下
- 删除子模块：（分4步走哦）
  - $ git rm --cached [path]
  - 编辑“.gitmodules”文件，将子模块的相关配置节点删除掉
  - 编辑“ .git/config”文件，将子模块的相关配置节点删除掉
  - 手动删除子模块残留的目录

# Gerrit
- Automatically add Change-Id to your commit
  - `touch ~/commit_template.txt`
  - `scp -p -P 29418 <your username>@<your Gerrit review server>:hooks/commit-msg <local path to your git>/.git/hooks/` 下载生成Change-Id脚本
    - 测试生成脚本
    ```sh
    echo "change-id" > testChangeid.txt
    ./git/hooks/commit-msg testChangeid.txt
    cat testChangeid.txt
    ```
  - commit template: `git config --global commit.template ~/commit_template.txt`
    - `～/.gitconfig`
      >[commit]
      >    template = ~/commit_template.txt
    - `~/commit-template.txt`
      > some comments
      > Signed-off-by: MyName <myemail>
  - then git commit will automatically generate Change-Id
    - check `<your repo>/.git/COMMIT_EDITMSG` has Author and Change-Id
- `git push origin HEAD:refs/for/<branch>`

# 场景
## 解决错误
- git fsck --full --strict
- git prune -v
- git repack -adf --window=5
- git gc --aggressive

## Github fork
- click 'Fork'
- git clone your-ssh-git-url
- git remote add --track master upstream git://github.com/upstreamname/projectname.git
  - git remote add upstream git://github.com/upstream/project
- git fetch upstream
- git merge upstream/master
- git branch newfeature
- git checkout newfeature


## Submitting a Pull Request
- git push origin newfeature
- click 'Pull Request'
- click 'Submit Pull Request'
- click 'Merge'

# 资料
- http://www.ithao123.cn/content-1544598.html
