# source ~/.bash_profile
# echo $PATH

#how-to-show-hidden-file-or-folder-of-macos
# defaults write com.apple.finder AppleShowAllFiles -boolean true
# killall Finder
# defaults delete com.apple.finder AppleShowAllFiles
# killall Finder

#JAVA_HOME
export JAVA_HOME=`/usr/libexec/java_home`
#nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
#node
#export PATH=$HOME/.nodebrew/node/v6.3.1/bin:$PATH
export PATH=$HOME/.nodebrew/node/v7.2.1/bin:$PATH
#Homebrew git
#export PATH="/usr/local/Cellar/git/2.11.0/bin:$PATH"
export PATH=/usr/local/Cellar/git/2.11.0/libexec/git-core:$PATH
# Command Line Tools
export PATH=/Library/Developer/CommandLineTools/usr/bin:$PATH

#http://qiita.com/magicant/items/d3bb7ea1192e63fba850
test -r ~/.bashrc && . ~/.bashrc

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/n_ejiri/.sdkman"
[[ -s "/Users/n_ejiri/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/n_ejiri/.sdkman/bin/sdkman-init.sh"
