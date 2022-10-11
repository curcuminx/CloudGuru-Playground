# BREAKY-BREAKY K8s PLAYGROUND

dependecies:
- Puppet Bolt
- ExpectShell

follow these guidelines, don't give yourself a headache yet:
1. Go to CloudGuru, set up 2  Ubuntu 20.01 machines (4 units each, better safe than sorry). 
   1. if you feel like going with other distros - go ahead, make sure to refer "./hiera.yaml" and "./data/common.yaml"
2. what goes into "./files/pre-run/pre-env" and "./files/k8s-env":
   1. connection creds
   2. priv+pub IPs
   3. machines hostnames put them in:
3. search "mostsecurepasswordinthewholewideworld" and replace it with your own - for now it's hardcoded.
4. run shady "run.sh" script, cross fingers.
5. go through the instructions provided at the end of Puppet dist process.
    1. you should be able to view the cluster UI from a local SSH proxy
    2. secrets available locally in "./files/k8s_secrets"
6. watch out for CloudGuru's timeout obnoxious IP re-assigning.
   it should break your access/proxy/etc. - re-establish connections by re-inserting cred/IP info on "pre-env"
7. congrats you own a plain k8s cluster with 1 controller and 1 worker. deploy whatever.
8. everything is set. breaky-breaky :)

Security Note:
- do not share anything from:
  - ./files/pre-run/pre-env
  - ./files/k8s_secrets
  - ./data/*
