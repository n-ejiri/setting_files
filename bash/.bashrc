##Extension
# Login user variable
loginuser='/bin/echo $USER'

# ls
alias la='/bin/ls -a'
alias ll='/bin/ls -altr'

# cp
function cpap() {
	/bin/cp -ap $1 $2;
}
alias cpap=cpap

#http://www.rickynews.com/blog/2014/07/19/useful-bash-aliases/
function cleanup() {
	/usr/bin/find . -type d -maxdepth 2 -empty -exec /bin/rmdir -v {} \; 2>/dev/null
	/usr/bin/find . -type d -maxdepth 2 -empty -exec /bin/rmdir -v {} \; 2>/dev/null
}
alias cleanup=cleanup

# ping
function healthcheck() {
    /sbin/bin/ping -c $1 $2;
}
alias healthcheck=healthcheck

# locate updatedb
#sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
alias updatedb='/usr/bin/sudo /usr/libexec/locate.updatedb'
# Locate search count
function cntsach() {
	/usr/bin/locate $@ | wc -l;
}
alias cntsach=cntsach
# no make .DS_Store
#defaults write com.apple.desktopservices DSDontWriteNetworkStores true
# make .DS_Store
#defaults write com.apple.desktopservices DSDontWriteNetworkStores false
# .DS_Store search
function gomisach() {
	/usr/bin/locate .DS_Store | /usr/bin/wc -l;
}
alias gomisach=gomisach

# current user .DS_Store delete
alias dsclean='/usr/bin/find . -name .DS_Store -exec rm -fr {} \;'

# rm
alias rr='/bin/rm -r $@'

# find
#Permission denied exclude
alias dsfind='/usr/bin/find / -name .DS_Store 2>/dev/null'

##MacOSX
# open current directory in Finder
alias f='/usr/bin/open .'
#alias f='open -a Finder ./'
#AppleScript
function fa() {
	/usr/bin/osascript -e 'tell application "Finder" to activate';
}
alias fa=fa
# cd to the path of the front FInder window
#http://blog.glidenote.com/blog/2013/02/26/jumping-to-the-finder-location-in-terminal/
#http://brettterpstra.com/2013/02/09/quick-tip-jumping-to-the-finder-location-in-terminal/
function cdf() {
	target=`/usr/bin/osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
	if [ "$target" != "" ]
	then
		/usr/bin/cd "$target";
		/bin/pwd;
	else
		/bin/echo 'No Finder window found' >&2
	fi
}
alias cdf=cdf

# Open vim readonly file
function readfile() {
    /usr/bin/vim -R $1;
}
alias readfile=readfile

# Update bashrc and bsh_profile
alias updatebash='source ~/.bash_profile'

##Homebrew
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
alias hbdoctor='/usr/local/bin/brew doctor'
function hbinst() {
	/usr/local/bin/brew install $@;
}
alias hbinst=hbinst
alias hbupd='/usr/local/bin/brew update'
alias hbupg='/usr/local/bin/brew upgrade'
function hbsach() {
	/usr/local/bin/brew search $@;
}
alias hbsach=hbsach
alias hblst='/usr/local/bin/brew list'
function hbinf() {
    /usr/local/bin/brew info $1;
}
alias hbinf=hbinf

##mysql
# To connect run:
alias mysqlconn='/usr/local/bin/mysql -uroot'
# To have launchd start mysql now and restart at login:
alias mysqlhbsrun='/usr/local/bin/brew services start mysql'
# Or, if you don't want/need a background service you can just run:
alias mysqlrun='/usr/local/bin/mysql.server start'

##nodebrew
# Node.js all version list
alias ndlst='nodebrew ls-remote'
# Use version install
function ndinst() {
    nodebrew install-binary $1;
}
alias ndinst=ndinst
# Install version use setting
function nduse() {
    nodebrew use $1;
}
alias nduse=nduse
# Latest edition upgrade
alias ndbupg='nodebrew install selfupdate'

##node
# Latest edition upgrade
alias ndupg='nodebrew install latest'

##npm
# Latest edition upgrade
alias npupg='npm install -g npm'
# Update npm
alias npupd='npm update -g npm'

# Search npm Library
function npsach() {
    npm search $1;
}
alias npsach=npsach
# Search npm Install Library
function npmls() {
    npm ls $1;
}
alias npmls=npmls

##Eclipse
# clean start
alias clean='Eclipse.app/Contents/MacOS/eclipse -clean'

##AWS
#EC2
# pwd->Users/***->  cpap Downloads/***.pem .ssh/ | chmod 400or600 .ssh/***.pem
# dbverify gateway ec2
#alias dbveriec2='/usr/bin/ssh -i "/Users/n_ejiri/.ssh/dbverify.pem" ec2-user@ec2-52-197-145-86.ap-northeast-1.compute.amazonaws.com'
function verifyec2() {
    /usr/bin/ssh -i "/Users/n_ejiri/.ssh/dbverify.pem" ec2-user@$1;
}
alias verifyec2=verifyec2
# esmock gateway ec2
function esmoec2() {
    /usr/bin/ssh -i "/Users/n_ejiri/.ssh/esmock.pem" ec2-user@$1;
}
alias esmoec2=esmoec2
# crund test gateway ec2
function crudec2() {
    /usr/bin/ssh -i "/Users/n_ejiri/.ssh/dbcrudverifi.pem" ec2-user@$1;
}
alias crudec2=crudec2
# garoon api gateway ec2
# Elastic IP:52.196.140.186 Private IP Address:172.31.18.97 Public DNS:ec2-52-196-140-186.ap-northeast-1.compute.amazonaws.com ID:eipalloc-ad8fc2c8
function garapiec2() {
    /usr/bin/ssh -i "/Users/n_ejiri/.ssh/garoonapi.pem" ec2-user@52.196.140.186;
}
alias garapiec2=garapiec2
# Testing : Amazon Linux making docker image ec2
function docketes() {
    /usr/bin/ssh -i "/Users/n_ejiri/.ssh/docker-teskey.pem" ec2-user@$1;
}
alias docketes=docketes

# connect ec2
# $1:PEM file #2:Host(Public DNS)
function connectec2() {
    /usr/bin/ssh -i "/User/n_ejiri/.ssh/"$1 ec2-user@$2;
}
alias connectec2=connectec2

# ec2 file Download
# $1:PEM Name $2:Host(Public DNS) $3:Download File Path
function ec2download() {
    /usr/bin/scp -i "/Users/n_ejiri/.ssh/"$1 ec2-user@$2:$3 .;
}
alias ec2download=ec2download

# PEM file list
function pemlist() {
    /bin/ls -altr /Users/n_ejiri/.ssh/ | /usr/bin/grep .pem;
}
alias pemlist=pemlist

# add to new PEM file
function pemtoadd() {
    /bin/cp -ap $1 /Users/n_ejiri/.ssh/ | /bin/chmod 400 /Users/n_ejiri/.ssh/$1;
}
alias pemtoadd=pemtoadd

#SES
# $1:SES SMTP Endpoint $2:port(25, 465, 587 or 2587)
function sesoutbound() {
    /usr/bin/telnet $1 $2;
}
alias sesoutbound=sesoutbound

##Docker
# CONTAINER all count
alias dockcount='/usr/local/bin/docker ps -aq | /usr/bin/wc -l'
# Healthcheck
alias dockhealth='/usr/local/bin/docker ps -q | /usr/bin/wc -l'
# CONTAINER restart
function dockrestart() {
    /usr/local/bin/docker restart $@;
}
alias dockrestart=dockrestart
# All CONTAINER start
function dockallstart() {
    conid=$(/usr/local/bin/docker ps -aq);
    callid=$(/bin/echo);
    /usr/local/bin/docker start $callid $conid;
}
alias dockallstart=dockallstart
# All CONTAINER restart
#/usr/local/bin/docker restart $/bin/echo $(/usr/local/bin/docker ps -q)
function dockallrestart() {
    conid=$(/usr/local/bin/docker ps -q);
    callid=$(/bin/echo);
    /usr/local/bin/docker restart $callid $conid;
}
alias dockallrestart=dockallrestart
# CONTAINER Disp
alias dockcon='/usr/local/bin/docker ps'
# All CONTAINER Disp
alias dockall='/usr/local/bin/docker ps -a'
# Active CONTAINER ID Disp
#/usr/local/bin/docker ps -q
alias dockid='/usr/local/bin/docker ps --format "{{.ID}}"'
# Active CONTAINER ID Array Disp
alias dockarrid='/bin/echo $(/usr/local/bin/docker ps -q)'

##Elasticsearch
#alias esstart='elasticsearch & '
alias esrun='bin/elasticsearch -d -p ./tmp/pid'
function esplinst() {
	bin/plugin install $@;
}
alias esplinst=esplinst
alias esping='/usr/bin/curl -X GET http://localhost:9200/'
#ps aux | grep -v elasticsearch; kill pid; ps aux | grep [e]lasticsearch
alias espid='/bin/cat ./tmp/pid'
alias esstop='/bin/kill `cat ./tmp/pid`'

##Logstash
function lgsrun() {
	bin/logstash -f $@;
}
alias lgsrun=lgsrun

##Kibana
alias kbrun='bin/kibana'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/n_ejiri/.sdkman"
[[ -s "/Users/n_ejiri/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/n_ejiri/.sdkman/bin/sdkman-init.sh"
