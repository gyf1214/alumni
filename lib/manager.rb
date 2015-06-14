require 'digest'
require_rel 'config'

module Alumni
	module Manager
		include Config::Manager

		module_function

		def load
			Logger.info "Load setting"
			File.open(Setting, "r") do |file|
				@setting = Marshal.load file
			end
			

			Logger.info "Load index"
			if File.exist? Index
				File.open(Index, "r") do |file|
					@index = Marshal.load file
				end
			else
				Logger.warn "Index File not exist, create"
				@index = {}
				sync
			end

			@gen = Generator.new src: Model, settings: @setting

			Logger.info "Finish loading"
		end

		def sync
			Logger.info "Synchrognize index"
			File.open(Index, "w") do |file|
				Marshal.dump @index, file	
			end
			Logger.info "Synchrognize finished"
		end

		def hash name
			Logger.info "Hash file: #{name}"
			@index.store name, Array.new unless @index.key? name
			x = @index[name]
			md5 = Digest::MD5.new
			md5 << name << x.size.to_s
			y = md5.hexdigest
			Logger.info "Create index for #{name}, version: #{x.size} -> #{y}"

			x.push y
			sync
			y
		end

		def do! name, texts
			Logger.info "Start task: #{name}"
			last = Time.now
			path = File.expand_path hash(name), Files
			@gen.do! texts, path
			Logger.info "Finish task #{name} in #{Time.now - last}s"
		end

		def boxes
			@setting[:boxes].dup
		end
	end
end