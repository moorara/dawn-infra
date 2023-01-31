Host ${name}
  HostName ${address}
  User root
  IdentityFile ${private_key_file}
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null
  LogLevel error
