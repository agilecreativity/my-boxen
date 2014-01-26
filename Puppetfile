# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "2.0.0"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq"  ,"1.0.0"
github "gcc"      ,"1.0.0"
github "git"      ,"1.0.0"
github "homebrew" ,"1.1.2"
github "hub"      ,"1.0.0"
github "inifile"  ,"0.9.0" , :repo => "cprice-puppet/puppetlabs-inifile"
github "nginx"    ,"1.1.0"
github "nodejs"   ,"1.0.0"
github "nvm"      ,"1.0.0"
github "ruby"     ,"5.0.2"
github "stdlib"   ,"4.0.0" , :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo"     ,"1.0.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
# See: github.com/nzwsch/protips/blob/master/how-to-use-boxen.md
# for example
github "adium"               ,"1.0.1"
github "java"                ,"1.0.6"
github "clojure"             ,"1.2.0"
github "hipchat"             ,"1.0.2"
github "emacs"               ,"1.0.0"
github "things"              ,"1.0.0"
github "ccleaner"            ,"1.0.1"
github "alfred"              ,"1.0.1"
github "firefox"             ,"1.0.5"
github "iterm2"              ,"1.0.2"
github "asciiio"             ,"1.0.2"
github "kindle"              ,"1.0.0"
github "tunnelblick"         ,"1.0.0"
github "skitch"              ,"1.0.0"
github "elasticsearch"       ,"1.0.0"
github "dpkg"                ,"1.0.0"
github "caffeine"            ,"1.0.0"
github "vlc"                 ,"1.0.0"
github "virtualbox"          ,"1.0.1"
github "googleearth"         ,"1.0.0"
github "sysctl"              ,"1.0.0"
github "postgresql"          ,"1.0.0"
github "vagrant"             ,"2.0.5"
github "repository"          ,"2.2.0"
github "vim"                 ,"1.0.2"
github "skype"               ,"1.0.2"
github "tmux"                ,"1.0.1"
github "ibackup"             ,"1.0.1"
github "xquartz"             ,"1.1.0"
github "appcleaner"          ,"1.0.0"
github "chrome"              ,"1.1.0"
github "sublime_text_2"      ,"1.1.0"
github "keepassx"            ,"1.0.0"
github "wunderlist"          ,"1.0.0"
github "wkhtmltopdf"         ,"1.0.0"
github "xpdf"                ,"1.0.0"
github "wget"                ,"1.0.0"
github "cyberduck"           ,"1.0.0"
github "transmission"        ,"1.0.0"
github "heroku"              ,"2.0.0"
github "imagemagick"         ,"1.2.0"
github "gitx"                ,"1.2.0"
github "mou"                 ,"1.0.0"
github "notational_velocity" ,"1.1.0"
github "cinch"               ,"1.0.0"
github "redis"               ,"1.0.0"
github "vmware_fusion"       ,"1.0.0"
#github "osx"                 ,"1.0.0"
github "osx"                 ,"1.2.0"
github "zsh"                 ,"1.0.0"
github "dropbox"             ,"1.1.0"
github "eclipse"             ,"1.0.0", :owner => "pulse00"
github "macvim"              ,"1.0.0"
github "better_touch_tools"  ,"1.0.0"
github "toggl"               ,"1.0.2"
github "pycharm"             ,"1.0.1"
github "induction"           ,"1.0.0"
github "pow"                 ,"1.0.0"
github "calibre"             ,"0.0.3", :repo => "agilecoders/puppet-calibre"
github "unarchiver"          ,"1.0.0", :repo => "dieterdemeyer/puppet-unarchiver"
github "colloquy"            ,"1.0.0", :repo => "dieterdemeyer/puppet-colloquy"
github "handbrake"           ,"1.0.0"
github "googledrive"         ,"1.0.2"
github "jenkins"             ,"0.0.7"
github "pivotalbooster"      ,"1.0.3"
github "google_notifier"     ,"1.0.1"
github "xtrafinder"          ,"1.0.1"
github "sourcetree"          ,"0.0.2"
github "python"              ,"1.1.1"
