require './lib/config'

user 'gyf', 'gyf'

include Alumni::Config::Unicorn

worker_processes 2
working_directory Root
timeout 30

listen Sock, backlog: 1024
pid Pid
stdout_path Log
stderr_path Err

preload_app true

