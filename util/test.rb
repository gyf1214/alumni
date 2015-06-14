require './bootstrap'

Alumni::Logger.on :debug

txt = {name: '高匀丰'}
Alumni::Manager.load
Alumni::Manager.do! 'gyf', txt
