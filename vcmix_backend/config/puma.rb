app_root = '/var/www/vcmix_backend'
pidfile "/var/www/pids/vcmix_backend_puma.pid"
state_path "/var/www/pids/vcmix_backend_puma.state"
bind 'unix:/var/www/pids/vcmix_backend.sock'
stdout_redirect "/var/www/log/puma-vcmix_backend.stdout.log", "/var/www/log/puma-vcmix_backend.stderr.log", true
daemonize false
port 7001
environment 'production'
workers (ENV["workers"] || 4)
threads (ENV["min_threads"] || 8), (ENV["max_threads"] || 8)
preload_app!

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end