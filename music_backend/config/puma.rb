app_root = '/var/www/music_backend'
pidfile "/var/www/pids/music_backend_puma.pid"
state_path "/var/www/pids/music_backend_puma.state"
bind 'unix:/var/www/pids/music_backend.sock'
daemonize false
port 7002
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