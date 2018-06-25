function nginx::params(
  Hash  $options,
  Puppet::LookupContext  $context,
){
    $base_params = {

       'nginx::ensure'           => 'present',
       'nginx::config_dir'       =>  '/etc/nginx',
       'nginx::config_ensure'    => 'file',
       'nginx::config_mode'      => '0664',
       'nginx::config_owner'     => 'root',
       'nginx::config_group'     => 'root',
       'nginx::config_confd'     => "/etc/nginx/conf.d",
       'nginx::config_log_dir'   => '/var/log/nginx',
       'nginx::config_pid_file'  => '/run/nginx.pid',
      
       'nginx::service_name'       => 'nginx',
       'nginx::service_ensure'     => 'running',
       'nginx::service_pattern'    => 'nginx',
       'nginx::service_enable'     =>  true,
       'nginx::service_hasstatus'  =>  true,
       'nginx::service_hasrestart' =>  true,
       'nginx::docroot'            =>  '/usr/share/nginx',
      }

    $os_params  = case $facts['os']['family'] {
           'Debian': {
                { 'nginx::config_vdir_enable'   => '/etc/nginx',
                'nginx::config_process_user'  => 'www-data',
                'nginx::vhost_dir'            => '/etc/nginx/sites-enabled',
                'nginx::package_name'         => 'nginx-full' }
             }
            default: { 
                { 'nginx::config_vdir_enable'  => undef,
                 'nginx::config_process_user' => 'nginx', 
                 'nginx::vhost_dir'           => '/etc/nginx',
                 'nginx::package_name'         => 'nginx'    }
             }
       
        }
    $base_params  + $os_params


}

