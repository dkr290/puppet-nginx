class nginx(


$package_name,
$config_dir,
$config_ensure,
$config_mode,
$config_owner,
$config_group,
$config_confd,
$config_log_dir,
$config_pid_file,
$service_name,
$service_ensure,
$service_pattern,
$service_enable,
$service_hasstatus,
$service_hasrestart,
$docroot,
$config_vdir_enable,
$config_process_user,
$vhost_dir,


) {

class {'::nginx::install':}
-> class {'::nginx::config':
     notify => Class['::nginx::service'],
  }
  class {'::nginx::service':}


}
