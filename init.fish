# Load custom settings for current hostname
set -l host (hostname | sed -E 's/(-[0-9]+)?(\.(local|home))?$//')
set -q DOTFILEDIR; or set DOTFILEDIR ~/dotfiles
set -l host_specific_file $DOTFILEDIR/hosts/$host.fish
if test -e $host_specific_file
  source $host_specific_file
else
  echo Creating host specific config file: $host_specific_file
  mkdir -p (dirname $host_specific_file)
  touch $host_specific_file
end

# Load custom settings for current domain
set -l domain (hostname | sed -E 's|.*\.(.*)|\1|')
set -l domain_specific_file $DOTFILEDIR/domain/$domain.fish
if test -e $domain_specific_file
  source $domain_specific_file
else
  echo Creating domain specific file for $domain
  mkdir -p (dirname $domain_specific_file)
  touch $domain_specific_file
end

# Load custom settings for current user
set -l user_specific_file $DOTFILEDIR/users/(whoami).fish
if test -e $user_specific_file
  source $user_specific_file
else
  echo Creating user specific config file: $user_specific_file
  mkdir -p (dirname $user_specific_file)
  touch $user_specific_file
end

# Load custom settings for current OS
set -l platform_specific_file $DOTFILEDIR/platforms/(uname -s).fish
if test -e $platform_specific_file
  source $platform_specific_file
else
  echo Creating platform specific config file: $platform_specific_file
  mkdir -p (dirname $platform_specific_file)
  touch $platform_specific_file
end

