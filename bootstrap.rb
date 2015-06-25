require 'bundler'
Bundler.require
require_all 'lib'

#Alumni::Logger.on :debug
Alumni::Manager.load
