class plg_kube_hdfs::pods_definition (String $pod_name) {
  # kubernetes_pod { 'hdfs':
  #   ensure   => present,
  #   metadata => {
  #     namespace => 'default',
  #   },
  #   spec     => {
  #     containers => [{
  #       name  => 'container-name',
  #       image => 'nginx',
  #     }]
  #   },
  # }
}