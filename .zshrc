########################################
# 環境変数
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors
 
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
 
# プロンプト
PROMPT='%K{0}%F{2}( '\'-\'')ﾇｰﾝ%f%F{1}[%f%F{4}%~%f%F{1}]%f%k >>> '
 
# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified
 
########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit
 
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
 
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
 
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
 
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
 
zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'
 
function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg
 
 
########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
 
# beep を無効にする
setopt no_beep
 
# フローコントロールを無効にする
setopt no_flow_control
 
# Ctrl+Dでzshを終了しない
setopt ignore_eof
 
# '#' 以降をコメントとして扱う
setopt interactive_comments
 
# ディレクトリ名でcd、かつls -lしてくれる
setopt auto_cd
funtion chpwd() { ls -l }

# コマンドのスペル訂正
setopt correct
# コマンドを訂正した上でコメント＆画像表示 
function command_not_found_handler(){
 if [ -e /usr/local/bin/jp2a ];then
   if [ -e ~/Downloads/nuko.jpeg ];then
     jp2a ~/Downloads/nuko.jpeg --width=50
   fi
 fi
 echo " '$1' なんてコマンドは無いにゃ"
}

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
 
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
 
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
 
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
 
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
 
# 高機能なワイルドカード展開を使用する
setopt extended_glob

#バックグラウンドの状態を報告
setopt notify
 
########################################
# キーバインド
 
# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward
 
#キーバインドをvimの設定にする
bindkey -v

########################################
# エイリアス
alias c='clear'
alias j='jobs'
alias k='kill'
alias m='more'
alias la='ls -a'
alias ll='ls -l'
alias lal='la -al' 
alias t='type'
alias ta='type -a'
alias e='exit'
#for tmux
alias tmux-sb='tmux save-buffer - | pbcopy'
alias rm='rm -i'
alias rmf='rm -rf'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias vz="vim ~/.zshrc"
#Display date for 'history'
alias his='history'
alias his='fc -lt '%F %T' 1'
# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '
# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'
#nocコマンドでhistoryからコマンドの使用ランキング上位５位が出力
alias noc="cat ~/.zsh_history | awk '{print \$1}' | sort | uniq -c | sort -rn | head -5 "
#Open google Chrome
alias chrome='open -a "/Applications/Google Chrome.app"'
#Open safari and firefox
alias safari='open -a safari'
alias firefox='open -a firefox'
#ssh
alias ssh='ssh s1230027@sshgate.u-aizu.ac.jp'
alias dssh='ssh -D 8000'
alias xssh='ssh -x'
#sftp
alias sftp='sftp s1230027@sshgate.u-aizu.ac.jp'

#Open Preview
alias prev='open /Applications/Preview.app/'

###########################################
#cdした後に自動でlaコマンドを実行してくれる
#function cdls(){
#  builtin cd $1 && ls -l
#}
#alias cd='cdls'
############################################

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

############################################

#Golang 環境設定

export GOPATH=$HOME/gocode
export GOROOT=/usr/local/opt/go/libexec
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

############################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

############################################
