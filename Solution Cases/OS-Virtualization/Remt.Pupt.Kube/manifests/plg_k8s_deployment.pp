
class plg_kube_hdfs::plg_k8s_deployment {
  node 'plg_controller' {
    # notify { "hmmmm: ${$cont_hostname}": }
    # contain plg_kube_hdfs::your_hostnaming_convention_suck
    # contain plg_kube_hdfs::your_sshd_config_as_well

    host { 'plg_controller_host_config':
      name => $facts['opt_cont_hostname'],
      ip => $facts['networking']['ip']
    }

    class { 'kubernetes':
      controller => true,
    }
  }

  node 'plg_worker' {
    # notify { "hmmmm: ${$work_hostname}": }
    # contain plg_kube_hdfs::your_hostnaming_convention_suck
    # contain plg_kube_hdfs::your_sshd_config_as_well

    host { 'plg_worker_host_config':
      name => $facts['opt_work_hostname'],
      ip => $facts['networking']['ip']
    }

    class {'kubernetes':
      worker => true,
    }
  }
}
