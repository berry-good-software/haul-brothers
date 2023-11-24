server "d-vault.local",
  user: "bruce",
  roles: %w{web},
  ssh_options: {
    forward_agent: true,
    auth_methods: %w(publickey password)
  }
