# Whats pandoc

- converter from document format (markdown/reStructuredText etc) to html
- usage (require setup and shell-conf)
```
# output to terminal
pandoc README.md -o readme.html
# output to html
pandoc README.md -o readme.html

# view with lynx
rmd README.md
```

![example](https://github.com/matsu0228/tools/blob/master/blob/media/pandoc.gif)

# setup

- install with yum
```
sudo yum install -y epel-release
sudo yum install -y pandoc
sudo yum install -y lynx
```

- view markdown in your shell
```
rmd () {
  pandoc $1 | lynx -stdin
}
```

- make html from markdown with github css
```
# get github css
# check url : https://gist.githubusercontent.com/andyferra/
wget https://gist.githubusercontent.com/andyferra/2554919/raw/10ce87fe71b23216e3075d5648b8b9e56f7758e1/github.css

# set content in local
mkdir ~/.pandoc
cp github ~/.pandoc
cd ~/.pandoc
wget https://raw.githubusercontent.com/gollum/gollum/master/lib/gollum/public/gollum/images/para.png
wget https://raw.githubusercontent.com/gollum/gollum/master/lib/gollum/public/gollum/images/dirty-shade.png

pandoc (src.md) -s --self-contained -t html5 -c github.css -o (dst.html)
```

<!--
# cannnot install followings

- stack (package builder written by Hasckell)
```
$ echo -e "
[petersen-stack]
name=Copr repo for stack owned by petersen
baseurl=https://copr-be.cloud.fedoraproject.org/results/petersen/stack/epel-7-x86_64/
type=rpm-md
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://copr-be.cloud.fedoraproject.org/results/petersen/stack/pubkey.gpg
repo_gpgcheck=0
enabled=1
enabled_metadata=1
" | sudo tee  /etc/yum.repos.d/petersen-stack-epel-7.repo
$ sudo yum -y install stack
```

- pandoc
```
$ wget https://github.com/jgm/pandoc/archive/1.19.2.1.tar.gz
$ tar xf 1.19.2.1.tar.gz
$ mv pandoc-1.19.2.1/  pandoc
$ cd pandoc

# template
git clone https://github.com/jgm/pandoc-templates.git
cd -p pandoc-templates/default.* pandoc-1.19.2.1/data/templates/
```

- setup with stack
```
# rename
mv data/templates/default.html4 data/templates/default.html
mv data/templates/default.docbook4 data/templates/default.docbook
mv data/templates/default.epub2 data/templates/default.epub

$ stack setup
$ stack install --test
[error]
/usr/bin/ld: cannot find -lgmp
[try]
yum install gmp-devel.x86_64


$ cd .stack-work/install/x86_64-linux/lts-7.14/8.0.1/bin
$ sudo cp -p pandoc /usr/local/bin/
pandoc -v
```
-->

