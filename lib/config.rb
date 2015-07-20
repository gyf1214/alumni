module Alumni
	module Config
		module Common
			Path = Dir.getwd
			Data = File.expand_path 'data', Path
			Assets = File.expand_path 'assets', Path
			Temp = File.expand_path 'tmp', Path
			Public = File.expand_path 'public', Path
		end

		module Manager
			Path = Common::Data
			Index = File.expand_path 'index', Path
			Setting = File.expand_path 'setting', Path
			Model = File.expand_path 'model.jpg', Common::Public
			Files = File.expand_path 'files/', Path
		end

		module Assets
			Path = Common::Assets

			CssSrc = File.expand_path 'application.scss', Path
			CssOut = File.expand_path 'css/application.css', Common::Public
			CssCache = File.expand_path '.scss_cache/', Common::Temp

			Setting = File.expand_path 'setting.json', Path
		end

		module Unicorn
			Path = Common::Temp
			Root = Common::Path

			Log = File.expand_path 'application.log', Path
			Err = File.expand_path 'error.log', Path
			Pid = File.expand_path 'application.pid', Path
			Sock = File.expand_path 'application.sock', '/var/run/ruby'
		end
	end
end
