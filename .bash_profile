#   -------------------------------
#   1.  ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Set Paths
#   ------------------------------------------------------------
    export PATH="$PATH:/usr/local/bin"
    export PATH="/usr/local/git/bin:/sw/bin:/usr/local/bin:/usr/local:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

#   Set Default Editor
#   ------------------------------------------------------------
    export EDITOR=/usr/local/bin/atom

#   Set the home folder of Tomcat
#   ------------------------------------------------------------
    export TOMCAT_HOME=/usr/local/Cellar/tomcat@7/7.0.82/libexec

#   Set the home folder of patsat
#   ------------------------------------------------------------
    export PATSAT_HOME=~/Code/monolith/patsat-service

#   Set the home folder of my code
#   ------------------------------------------------------------
    export SOURCE_ROOT=~/Code/monolith

#   Set the home folder of brew
#   ------------------------------------------------------------
    export BREW_HOME=/usr/local/Cellar

    #   Set the home folder of nvm
    #   ------------------------------------------------------------
    export NVM_DIR="~/.nvm"
    . "/usr/local/opt/nvm/nvm.sh"

#   Set the home folder of my tools
#   ------------------------------------------------------------
    export TOOLS_HOME=$SOURCE_ROOT/patsat-service/tools
    export PATH="$TOOLS_HOME:$PATH"

#   Allocate more space for service tests
#   ------------------------------------------------------------
    export MAVEN_OPTS="-Xms512m -Xmx1024m -XX:MaxPermSize=256m"

#   Use the docker version of devdockerapp01.healthsparq.com
#   ------------------------------------------------------------
    export NVM_DIR="/Users/r627139/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#   Set up ruby
#   ------------------------------------------------------------
    eval "$(rbenv init -)"

#   Set up python
#   ------------------------------------------------------------
    eval "$(pyenv init -)"

    #   -----------------------------
    #   2.	MAKE TERMINAL BETTER
    #   -----------------------------

    alias c='clear'                                # A shorter clear
    alias vi='vim'									               # Preferred editor over vi
    alias svi='sudo vi'								             # Quick sudo vim
    alias edit='atom'							                 # Edit in atom
    alias sedit='sudo atom'                        # Edit in atom as a super user.
    alias refreshProfile='source ~/.bash_profile'	 # Source the bash profile
    alias cp='cp -iv'                           	 # Preferred 'cp' implementation
    alias mv='mv -iv'                           	 # Preferred 'mv' implementation
    alias mkdir='mkdir -pv'                     	 # Preferred 'mkdir' implementation
    alias ping='ping -c 5'                          # Stop after sending count ECHO_REQUEST packets
    alias now='date +"%T"'                          # Get the time
    alias cd..='cd ../'                             # Go back 1 directory level (for tast fypers)
    alias ..='cd ../'                               # Go back 1 directory level
    alias ...='cd ../../'                           # Go back 2 directory levels
    alias .3='cd ../../../'                         # Go back 3 directory levels
    alias .4='cd ../../../../'                      # Go back 4 directory levels
    alias .5='cd ../../../../../'                   # Go back 5 directory levels
    alias .6='cd ../../../../../../'                # Go back 6 directory levels
    alias f='open -a Finder ./'                     # f:            Opens current directory in MacOS Finder
    alias code='cd ~/Code/'               # Go to my code
    mcd () { mkdir -p "$1" && cd "$1"; }            # mcd:          Makes new Dir and jumps inside
    trash () { command mv "$@" ~/.Trash ; }         # trash:        Moves a file to the MacOS trash
    ql () { qlmanage -p "$*" >& /dev/null; }        # ql:           Opens any file in MacOS Quicklook Preview

    #   lr:  Full Recursive Directory Listing
    #   ------------------------------------------
    	alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

    #   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
    #           displays paginated result with colored search terms and two lines surrounding each hit.             Example: mans mplayer codec
    #   --------------------------------------------------------------------
        mans () {
            man $1 | grep -iC2 --color=always $2
        }

    #   -------------------------------
    #   3.  FILE AND FOLDER MANAGEMENT
    #   -------------------------------

    zipf () { zip -r "$1".zip "$1" ; }              # zipf:         To create a ZIP archive of a folder
    alias numFiles='echo $(ls -1 | wc -l)'          # numFiles:     Count of non-hidden files in current dir

    #   extract:  Extract most known archives with one command
    #   ---------------------------------------------------------
        extract () {
            if [ -f $1 ] ; then
              case $1 in
                *.tar.bz2)   tar xjf $1     ;;
                *.tar.gz)    tar xzf $1     ;;
                *.bz2)       bunzip2 $1     ;;
                *.rar)       unrar e $1     ;;
                *.gz)        gunzip $1      ;;
                *.tar)       tar xf $1      ;;
                *.tbz2)      tar xjf $1     ;;
                *.tgz)       tar xzf $1     ;;
                *.zip)       unzip $1       ;;
                *.Z)         uncompress $1  ;;
                *.7z)        7z x $1        ;;
                *)     echo "'$1' cannot be extracted via extract()" ;;
                 esac
             else
                 echo "'$1' is not a valid file"
             fi
        }

    #   movtogif: exprot a .mov file to a .gif
    #   --------------------------------------------------
    movtogif() {
      ffmpeg -i $1.mov -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1.gif
    }

    #   ---------------------------
    #   4.  SEARCHING
    #   ---------------------------

    alias qfind="sudo find . -name "                 # qfind:    Quickly search for file
    ff () { sudo /usr/bin/find . -name '*'"$@"'*' ; }      # ff:       Find file under the current directory
    ffs () { sudo /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
    ffe () { sudo /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

    #   spotlight: Search for a file using MacOS Spotlight's metadata
    #   -----------------------------------------------------------
        spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

    #   ---------------------------
    #   5.  NETWORKING
    #   ---------------------------

    alias myip='curl ifconfig.me/ip'                    # myip:         Public facing IP Address
    alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
    alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
    alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
    alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
    alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
    alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
    alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
    alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
    alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

    #   killPort: kills all processes on a specific tcp port
    #   usage: killPort $PORT
    #   ----------------------------------------------------------
        killPort() {
            lsof -i tcp:$1 | grep -v PID | awk '{print $2}' | xargs kill -9;
        }

    #   ii:  display useful host related informaton
    #   -------------------------------------------------------------------
        ii() {
            echo -e "\nYou are logged on ${RED}$HOST"
            echo -e "\nAdditionnal information:$NC " ; uname -a
            echo -e "\n${RED}Users logged on:$NC " ; w -h
            echo -e "\n${RED}Current date :$NC " ; date
            echo -e "\n${RED}Machine stats :$NC " ; uptime
            echo -e "\n${RED}Current network location :$NC " ; scselect
            echo -e "\n${RED}Public facing IP Address :$NC " ;myip
            echo
        }

    #   ---------------------------------------
    #   6.  SYSTEMS OPERATIONS & INFORMATION
    #   ---------------------------------------

    #   iamthecaptainnow: removes master level blocks
    #   -----------------------------------------------------------------------------------
        alias iamthecaptainnow='sudo spctl --master-disable'

    # 	Show and hide hidden files in Finder
    #   ---------------------------------------------------------
    	alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
    	alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

    #   ---------------------------------------
    #   5. Java Development
    #   ---------------------------------------

    alias dockerKillAll='docker kill $(docker ps -q)'
    alias dockerDeleteAll='docker rmi $(docker images -q)'
    alias localstack='docker run -d --restart unless-stopped --name localstack -p 4569:4569 -p 4574:4574 -p 4572:4572 -p 4575:4575 -p 4576:4576 -p 8080:8080 -e "DEBUG=s3" -e "DATA_DIR=/data" -e "PORT_WEB_UI=8080" -e "LAMBDA_EXECUTOR=local" -e "KINESIS_ERROR_PROBABILITY=0.0" -e "DOCKER_HOST=unix:///var/run/docker.sock" localstack/localstack'
    alias redis='docker run -d -p 6379:6379 --restart unless-stopped --name redis -t -i redis:3.2.6-alpine'
    alias jmeter='open /usr/local/bin/jmeter'
    alias elasticsearchStart='brew services start elasticsearch'
    alias elasticsearchStop='brew services stop elasticsearch'

    #   ---------------------------------------
    #   7.  WEB DEVELOPMENT
    #   ---------------------------------------
    alias startTomcat="$TOMCAT_HOME/bin/startup.sh"                          # startTomcat: run tomcat
    alias killTomcat="$TOMCAT_HOME/bin/shutdown.sh;"                         # killTomcat: shuts the running tomcat down
    alias tomcatEdit='edit $TOMCAT_HOME/conf/context.xml'	  			          # tomcatEdit		Edit context.xml
    alias apacheEdit='edit /private/etc/apache2/extra/httpd-other.conf'         # apacheEdit:       Edit httpd.conf
    alias apacheRestart='sudo apachectl -k restart'                 			      # apacheRestart:    Restart Apache
    alias editHosts='sudo edit /etc/hosts'                        			        # editHosts:        Edit /etc/hosts file
    alias herr='tail /var/log/httpd/error_log'                    			        # herr:             Tails HTTP error logs
    alias apacheLogs="tail -f /var/log/apache2/error_log"         			        # Apachelogs:   	Shows apache error logs
    httpHeaders () { /usr/bin/curl -I -L $@ ; }                   			        # httpHeaders:      Grabs headers from web page

    #   setContext: set the context to a specific environment
    #   ------------------------------------------------------------------
        function setContext {
            builtin pushd $TOOLS_HOME && ./setDevEnv.sh "$@" && popd
        }
        alias lsContext='ls $TOOLS_HOME/context-files/'

    #   ---------------------------------------
    #   8.  Healthsparq specific
    #   ---------------------------------------
    alias dev='ssh devapp01.healthsparq.com'                  				# dev:		    Log into the dev tomcat server
    alias impdev='ssh impdevapp01.healthsparq.com'                  		# impdev:	    Log into the impdev tomcat server
    alias int2='ssh int2pod02.healthsparq.com'                  			# int2:		    Log into the int2 tomcat server
    alias int='ssh intap01.healthsparq.com'                  				# int:		    Log into the int tomcat server
    alias imptst2='ssh imptst2app01.healthsparq.com'                  		# imptst2:	    Log into the imptst2 tomcat server
    alias integration='ssh  integrationpod01.healthsparq.com'               # integration:  Log into the integration tomcat server

    function resetChrome() {
      killall "Google Chrome" 2>/dev/null
      killall "Google Chrome" 2>/dev/null
      rm -f ~/Library/Application\ Support/Google/Chrome/Local\ State
    }


    #   prod: starts a numbered prod ssh session.
    #   ex. prod 1
    #   ------------------------------------------
        function __proda() {
            ssh prdapp0$1.healthsparq.com
        }
        alias proda='__proda'

    #   prodb: starts a numbered prod ssh session.
    #   ex. prodb 1
    #   ------------------------------------------
        function __prodb() {
            ssh prdapp0$1b.healthsparq.com
        }
        alias prodb='__prodb'

        #   prodc: starts a numbered prod ssh session.
        #   ex. prodc 1
        #   ------------------------------------------
          function __prodc() {
              ssh prdapp0$1c.healthsparq.com
          }
          alias prodc='__prodc'


    alias leaveReviewUI='(cd $SOURCE_ROOT/leave-review-ui && ember s -proxy http://localhost:8081)'

    alias pullAll='$PATSAT_HOME/tools/pullAll.sh'                              # pullAll:      pulls the main healthsparq projects
    alias statusAll='$PATSAT_HOME/tools/statusAll.sh'   # statusAll:    returns the git status of the main healthsparq projects

    alias solrEdit='edit /usr/local/Cellar/solr4/4.10.4/search/solr/provider/conf/search-data-config.xml'

    #   solrStart: builds and starts solr from the solrconfig git repo
    #              to http://localhost:8983/solr/#/
    #   ------------------------------------------
        function __startSolr() {
            chmod +x $TOOLS_HOME/startSolr.sh;
            $TOOLS_HOME/startSolr.sh;
        }
        alias solrStart='__startSolr'

    #   switchBranch: pulls all of the major healthsparq projects from the specified branch
    #   ---------------------------------------
        switchBranch() { $TOOLS_HOME/switchBranch.sh $1;}

    #   clearProductionLogs: deletes all production logs
    #   ------------------------------------------
        function clearLogs() {
            (
                  rm -rf ~/productionLogs/;
            );
        }

    #   productionXXXXLogs: Pull down the production logs
    #   ------------------------------------------------------------
    # $1 = server prdapp01b
    # $2 = log location /app/tomcat/tomcat-reviews/logs/*
      function __pullLog () {
          mkdir -p ~/productionLogs/$2;
          scp $2.healthsparq.com:$1.2017-12*.txt ~/productionLogs/$2/;
          # (
          #   cd ~/productionLogs;
          #   gunzip -f **/*.gz;
          # )
      }

      function __pullLogs () {
        # __pullLog $2 $101b;
        # __pullLog $2 $102b;
        # __pullLog $2 $103b;
        # __pullLog $2 $104b;
        # __pullLog $2 $105b;
        # __pullLog $2 $106b;
        __pullLog $2 $101;
        __pullLog $2 $102;
        __pullLog $2 $103;
        __pullLog $2 $104;
        __pullLog $2 $105;
        __pullLog $2 $106;
      }

      function pullReviewLogs () {
          __pullLogs prdapp "/app/tomcat/tomcat-reviews/logs/"
      }

      function pullPatsatAccess () {
        clearLogs
        __pullLogs prdapp "/app/tomcat/tomcat-reviews/logs/localhost_access_log"
      }

      function pullHealthsparqLogs () {
        __pullLogs $1 "/app/logs/tomcat-healthsparq"
      }

      # (
      #   cd ~/productionLogs;
      #   gunzip -f **/*.gz;
      # )

    #   buildUi: pulls and builds the UI
    #   ------------------------------------------
        function __buildUi() {
            (
                    cd $SOURCE_ROOT/healthsparq-ui;
                    git pull;
                    sudo rm -rf bower_components && rm -rf node_modules;
                    npm install;
                    bower install;
                    sudo chmod -R g+xr .
                    sudo chmod g+xr /Users/r627139/.config/configstore/ember-cli.json
                    ## Do build
                    ember build;
                );
        }
        alias buildUi='__buildUi'

    #   cleanUi: cleans up all of the ui dependancies.
    #   ------------------------------------------
        function __cleanUi () {
            sudo find /Users/r627139 -type d -exec chmod 775 {} \;
            buildUi;
        }
        alias cleanUi='__cleanUi'

    #   startUi: deploys the ui code
    #   ------------------------------------------
        function __startUi () {
            apacheRestart;
            sudo chown $USER /Users/r627139/.config/configstore/ember-cli.json
            chmod +x /$TOOLS_HOME/runLocalUI.sh;
            $TOOLS_HOME/runLocalUI.sh;
        }
        alias startUi='__startUi'

    #   buildAll: builds the main healthsparq projects
    #   ------------------------------------------
        function __buildAll () {
            cleanUi;
            /Users/r627139/Documents/Code/patsat/tools/buildAll.sh;
            apacheRestart;
        }
        alias buildAll='__buildAll'

    #   create env
    #   ---------------------------------------
        function createEnv() {
          # brew
          xcode-select --install
          ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
          brew install automake
          brew install awscli
          brew install coreutils
          brew install cowsay
          brew install diff-so-fancy
          brew install dos2unix
          brew install ffmpeg
          brew install gedit
          brew install gifsicle
          brew install gource
          brew install gradle
          brew install kafka
          brew install leiningen
          brew install libksba
          brew install libyaml
          brew install maven
          brew install openssl@1.1
          brew install rbenv
          brew install shared-mime-info
          brew install solr
          brew install pivotal/tap/springboot
          brew install watch
          brew install yarn

          # nvm
          curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
        }

        function updateRemotes() {
          CUR_DIR=$(pwd)
          echo "\nUpdating remotes for all repositories...\n"
          for i in $(find . -mindepth 1 -maxdepth 1 -type d); do
              #printf "";
              printf "\nIn Folder: $i";
              cd "$i";
              #cd ..;

              # get old REMOTE
              #git remote -v
              printf "\n"
              THIS_REMOTES="$(git remote -v)"
              arr=($THIS_REMOTES)
              OLD_REMOTE="${arr[1]}";

              NEW_REMOTE="${OLD_REMOTE/git.healthsparq.net/git.ccs.healthcare}"

              printf "New remote: $NEW_REMOTE"

              printf "\n"


              # update remotes
              git remote set-url origin "$NEW_REMOTE"

              # finally pull
              #git pull origin master;

              cd $CUR_DIR
          done

          printf "\nComplete!\n"
        }

    #   ---------------------------------------
    #   9. Display GIT information
    #   DEPENDANCIES: ~/.git-completion.sh and ~/.git-prompt.sh
    #   ---------------------------------------

    # enable the git bash completion commands
    source ~/Code/setup-env/.git-completion.sh

    # Load in the git branch prompt script.
    source ~/Code/setup-env/.git-prompt.sh

    # enable git unstaged indicators - set to a non-empty value
    GIT_PS1_SHOWDIRTYSTATE="."

    # enable showing of untracked files - set to a non-empty value
    GIT_PS1_SHOWUNTRACKEDFILES="."

    # enable stash checking - set to a non-empty value
    GIT_PS1_SHOWSTASHSTATE="."

    # enable showing of HEAD vs its upstream
    GIT_PS1_SHOWUPSTREAM="auto"

    BLACK=$(tput setaf 0)
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    LIME_YELLOW=$(tput setaf 190)
    POWDER_BLUE=$(tput setaf 153)
    BLUE=$(tput setaf 4)
    MAGENTA=$(tput setaf 5)
    CYAN=$(tput setaf 6)
    WHITE=$(tput setaf 7)
    BRIGHT=$(tput bold)
    NORMAL=$(tput sgr0)
    BLINK=$(tput blink)
    REVERSE=$(tput smso)
    UNDERLINE=$(tput smul)

    # set the prompt to show current working directory and git branch name, if it exists
    PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "

    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
