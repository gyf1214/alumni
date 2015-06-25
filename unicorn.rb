require './lib/config'

user 'gyf', 'gyf'

worker_processes 2
working_directory Alumni::Config::Unicorn::Root
timeout 30

listen Alumni::Config::Unicorn::Sock, backlog: 1024
pid Alumni::Config::Unicorn::Pid
stdout_path Alumni::Config::Unicorn::Log
stderr_path Alumni::Config::Unicorn::Err

preload_app true

