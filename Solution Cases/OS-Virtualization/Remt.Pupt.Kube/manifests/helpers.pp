# class plg_kube_hdfs::your_hostnaming_convention_suck {
#   class { 'hostname':
#     hostname => $facts['cont_hostname'],
#     alias    => $facts['opt_cont_hostname'],
#     ip       => $facts['networking']['ip']
#   }
# }
#
# class plg_kube_hdfs::your_sshd_config_as_well {
#   class { 'ssh::server':
#     storeconfigs_enabled => false,
#     options       => {
#       'ClientAliveInterval' => '360m',
#       'ClientAliveCountMax' => '200',
#     },
#   }
# }
#
# class plg_kube_hdfs::remove_unmanaged {
#
#   # always test with noop first!
#   resources { 'host':
#     purge => true,
#     noop  => false,
#   }
#
#   # remove ALL unmanaged host resources
# }