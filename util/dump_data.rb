require './bootstrap'
require 'fileutils'

include Alumni
Manager.files.each do |k, v|
	Alumni::Logger.info "Dump files for #{k}, #{v.size} versions"
	dir = File.expand_path k, Manager::Dump
	Dir.mkdir dir unless File.exist? dir

	v.each_with_index do |name, index|
		path = File.expand_path name, Manager::Files
		dest = File.expand_path "#{index}.jpg", dir
		if File.exist? path
			FileUtils.cp path, dest
		else
			Alumni::Logger.warn "Skip #{name} version: #{index}. Source not found!"
		end
	end
end
