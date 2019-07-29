server '52.192.42.197', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/ray/.ssh/id_rsa'
