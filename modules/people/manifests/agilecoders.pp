class people::agilecoders {

  ## Shell and Utilities
  include zsh
  repository {'robbyrussell_oh-my-zsh':
    source => 'robbyrussell/oh-my-zsh',
    path => "/Users/${::luser}/.oh-my-zsh",
  }

  ## Misc Utilities
  include elasticsearch
  include dpkg
  include sysctl::ipforwarding
  include xquartz
  include wunderlist
  include wkhtmltopdf
  include xpdf
  include wget
  include cyberduck
  include transmission
  include imagemagick
  include mou
  include cinch

  ## Productivity Applications
  include things
  include ccleaner
  include alfred
  include asciiio
  include caffeine
  include appcleaner
  include ibackup
  include keepassx
  include notational_velocity::nvalt
  include better_touch_tools
  include toggl
  include calibre
  include googledrive
  include jenkins
  include pivotalbooster
  include google_notifier
  include xtrafinder
  include sourcetree

  # http://sourceforge.net/projects/grandperspectiv/
  # GrandPerspective is a utility application for Mac OS X that graphically displays the disk usage of a file system.
  package { 'Grand Perspective':
    source => "http://downloads.sourceforge.net/project/grandperspectiv/grandperspective/1.5.1/GrandPerspective-1_5_1.dmg",
    provider => appdmg,
  }

  #See: http://kiwi-app.net/
  package { 'Kiwi':
    source => "http://s3.amazonaws.com/Kiwi/Kiwi_3.0.1_1125.zip",
    provider => compressed_app,
  }

  # See: https://github.com/bradleywright/my-boxen/blob/master/modules/mailplane/manifests/stable.pp
  package { 'Mailplane':
    provider => 'compressed_app',
    source => 'http://dist.mailplaneapp.com/builds/Mailplane_2_8021.tbz'
  }

  include adium
  include dropbox
  include skype
  include skitch
  include hipchat
  include googleearth
  include tunnelblick
  include kindle
  include vlc
  include unarchiver
  include colloquy
  include handbrake

  ## Development Tools
  include iterm2::stable
  include sublime_text_2
  include eclipse
  include macvim
  include emacs
  include tmux
  include gitx::dev
  include pow
  include vim

  ## Virtualization
  include vmware_fusion
  include virtualbox
  include vagrant

  # vagrant::plugin { 'vagrant-vmware-fusion':
  #   license => 'puppet:///modules/people/joe/licenses/fusion.lic',
  # }

  ## optionally, we can install the box from a given location
  # vagrant::box { 'squeeze64/vmware_fusion':
  #  source => 'https://s3.amazonaws.com/github-ops/vagrant/squeeze64-6.0.7-vmware_fusion.box'
  # }

  ## Utilities
  package { 'unetbooin':
    source => "http://unetbootin.sourceforge.net/unetbootin-mac-latest.zip",
    provider => compressed_app,
  }

  ## Databases
  include redis
  include postgresql
  include induction

  ## Browsers
  include firefox
  include chrome::dev
  include chrome::canary

  ## Programming Languages
  include java
  include clojure
  include pycharm
  include python

  ## Git Configuration
  # see: https://github.com/grahamgilbert/my-boxen/blob/master/modules/people/manifests/grahamgilbert/applications.pp
  package { 'Github for Mac':
    source => 'https://github-central.s3.amazonaws.com/mac%2FGitHub%20for%20Mac%20111.zip',
    provider => compressed_app
  }

  git::config::global{ [
    'color.diff',
    'color.status',
    'color.branch'
  ]:
    value=>'auto'
  }

  git::config::global{ 'color.ui':
    value=>true
  }

  ## from: https://github.com/jdios/my-boxen/blob/master/modules/people/manifests/adamwalz.pp
  # OS X Configuration
  boxen::osx_defaults { 'Disable Dashboard':
    key => 'mcx-disabled',
    domain => 'com.apple.dashboard',
    value => 'YES'
  }

  boxen::osx_defaults { 'Disable the "Are you sure you want to open this application?" dialog':
    key => 'LSQuarantine',
    domain => 'com.apple.LaunchServices',
    value => 'true'
  }

  boxen::osx_defaults { 'Disable press-and-hold character picker':
    key => 'ApplePressAndHoldEnabled',
    domain => 'NSGlobalDomain',
    value => 'false'
  }

  boxen::osx_defaults { 'Save to disk, not to iCloud by default':
    key => 'NSDocumentsSaveNewDocumentsToCloud',
    domain => 'NSGlobalDomain',
    value => 'false'
  }

  boxen::osx_defaults { 'Expand save panel by default':
    key => 'NSNavPanelExpandedStateForSaveMode',
    domain => 'NSGlobalDomain',
    value => 'true'
  }

  boxen::osx_defaults { 'Expand print panel by default':
    key => 'PMPrintingExpandedStateForPrint',
    domain => 'NSGlobalDomain',
    value => 'true'
  }

  boxen::osx_defaults { 'Make function keys do real things, and not apple things':
    key => 'com.apple.keyboard.fnState',
    domain => 'NSGlobalDomain',
    value => 'true'
  }

  boxen::osx_defaults { 'Avoid creating .DS_Store files on network volumes':
    key => 'DSDontWriteNetworkStores',
    domain => 'com.apple.desktopdervices',
    value => 'true'
  }

}

# vim: ft=ruby tw=78:sw=2:ts=2:
