app_root = '/var/www/vcmix_backend'
pidfile "/var/www/pids/vcmix_backend_puma.pid"
state_path "/var/www/pids/vcmix_backend_puma.state"
bind 'unix:/var/www/pids/vcmix_backend.sock'
daemonize false
port 7001
workers (ENV["workers"] || 4)
threads (ENV["min_threads"] || 8), (ENV["max_threads"] || 8)
preload_app!

