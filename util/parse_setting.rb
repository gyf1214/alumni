require './bootstrap'

include Alumni
include Alumni::Config::Assets
path = ARGV[1] || Setting
settings = JSON.parse File.read(path)
outs = {}

def string_to_symbol x
	if x.instance_of? Hash
		x.inject Hash.new do |r, (k, v)|
			r.store	k.to_sym, string_to_symbol(v)
			r
		end
	elsif x.instance_of? Array
		x.map do |y|
			string_to_symbol y
		end
	else
		x
	end
end

outs = string_to_symbol settings

File.open(Manager::Setting, "w") do |file|
	Marshal.dump outs, file
end