# == Define: cleanup
#
# Full description of class cleanup here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'cleanup':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
define file_cleanup::cleanup (
  $file_name = $name,      # The name of the script file to be created.
  $file_path,              # The path where you want the file saved.
  $file_hash,              # Hash of path, name, mtime (age) of files to be [recursively] deleted.
  $owner = 'root',         # User that the cron job runs as.
  $group = 'root',         # Group that the cron job runs as.
  $mode = '0744',          # Permissions of the file.
) {

file { $file_name:

  path    => "${file_path}/${$file_name}",
  ensure  => present,
  owner   => $owner,
  group   => $group,
  mode    => $mode,
  content => template('file_cleanup/file_cleanup.erb'),

}


}
