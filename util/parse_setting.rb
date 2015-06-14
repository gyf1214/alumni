require './bootstrap'

include Alumni
include Alumni::Config::Assets
path = ARGV[1] || Setting
settings = JSON.parse File.read(path)

include Alumni::Options

outs = string_to_symbol settings

File.open(Manager::Setting, "w") do |file|
	Marshal.dump outs, file
end