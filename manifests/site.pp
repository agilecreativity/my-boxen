require boxen::environment
require homebrew
require gcc

Exec {
  group => 'staff',
  logoutput => on_failure,
  user => $luser,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::luser}"
  ]
}

File {
  group => 'staff',
  owner => $luser
}

Package {
  provider => homebrew,
  require => Class['homebrew']
}

Repository {
  provider => git,
  extra => [
    '--recurse-submodules'
  ],
  require => Class['git']
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx
  include nvm

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # node versions
  include nodejs::0-4
  include nodejs::0-6
  include nodejs::0-8

  # default ruby versions
  include ruby::1_8_7
  include ruby::1_9_3
  include ruby::2_0_0

  $rubyversion = '1.9.3-p429'

  ruby::gem { "foreman for ${rubyversion}":
    gem => 'foreman',
    ruby => $rubyversion
  }

  ruby::gem { "bundler for ${rubyversion}":
    gem => 'bundler',
    ruby => $rubyversion
  }

  ruby::gem { "rake for ${rubyversion}":
    gem => 'rake',
    ruby => $rubyversion
  }

  #ruby::gem { "librarian-puppet for ${rubyversion}":
  #  gem => 'librarian-puppet',
  #  ruby => $rubyversion
  #}

  # nice gems for debugging purporse
  ruby::gem { "awesome_print for ${rubyversion}":
    gem => 'awesome_print',
    ruby => $rubyversion
  }

  ruby::gem { "better_errors for ${rubyversion}":
    gem => 'better_errors',
    ruby => $rubyversion
  }

  ruby::gem { "binding_of_caller for ${rubyversion}":
    gem => 'binding_of_caller',
    ruby => $rubyversion
  }

  ruby::gem { "commands for ${rubyversion}":
    gem => 'commands',
    ruby => $rubyversion
  }

  ruby::gem { "pry-debugger for ${rubyversion}":
    gem => 'pry-debugger',
    ruby => $rubyversion
  }

  ruby::gem { "pry-doc for ${rubyversion}":
    gem => 'pry-doc',
    ruby => $rubyversion
  }

  ruby::gem { "pry-stack_explorer for ${rubyversion}":
    gem => 'pry-stack_explorer',
    ruby => $rubyversion
  }

  ruby::gem { "rails-env-switcher for ${rubyversion}":
    gem => 'rails-env-switcher',
    ruby => $rubyversion
  }

  ruby::gem { "cucumber-console for ${rubyversion}":
    gem => 'cucumber-console',
    ruby => $rubyversion
  }

  ruby::gem { "rspec-console for ${rubyversion}":
    gem => 'rspec-console',
    ruby => $rubyversion
  }

  ruby::gem { "gnuplut for ${rubyversion}":
    gem => 'gnuplot',
    ruby => $rubyversion
  }

  # see: tpope/pry-editline
  ruby::gem { "pry-editline for ${rubyversion}":
    gem => 'pry-editline',
    ruby => $rubyversion
  }

  # see: tpope/gem-ctags
  ruby::gem { "gem-ctags for ${rubyversion}":
    gem => 'gem-ctags',
    ruby => $rubyversion
  }

  # see: tpope/gem-browse
  ruby::gem { "gem-browse for ${rubyversion}":
    gem => 'gem-browse',
    ruby => $rubyversion
  }

  # common, useful packages
  package {
    [
      'ack',
      'antlr',
      'coreutils',
      'findutils',
      'gnu-tar',
      'dos2unix',
      'htop-osx',
      'tree',
      'zeromq',
      'midnight-commander',
      'renameutils',
      'rename',
      'colordiff',
      'trash',
      'readline',
      'git-flow',
      'git-flow-clone',
      'ctags-exuberant',
      'ag',
      'unrar',
      'lame',
      'media-info',
      'bash',
      'ranger',
      'jq'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

}
