require './bootstrap'

Alumni::Logger.on :debug

txt = {name: 'gyf'}
Alumni::Manager.load
Alumni::Manager.do! 'gyf', txt
