require 'digest'

module Alumni
	module Manager
		Path = 'data'
		Index = File.expand_path('index.json', Path)
		Setting = File.expand_path('setting.json', Path)
		Model = File.expand_path('model.bmp', Path)
		Files = File.expand_path('file', Path)

		module_function

		def load
			Logger.info "Load setting"
			@setting = Marshal.load Index

			Logger.info "Load index"
			if File.exist? Index
				@index = Marshal.load Index
			else
				Logger.warn "Index File not exist, create"
				@index = {}
				sync
			end

			Logger.info "Finish loading"
		end

		def sync
			Logger.info "Synchrognize index"
			Marshal.dump Index
			Logger.info "Synchrognize finished"
		end

		def hash name
			Logger.info "Hash file: #{name}"
			@index.store name, Array.new unless @index.key? name
			x = @index[name]
			md5 = Digest::MD5.new
			md5 << name << x.size
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
			gen = Generator.new src: Model, settings: @setting, path: path
			gen.do!
			Logger.info "Finish task #{name} in #{Time.now - last}s"
		end
	end
end