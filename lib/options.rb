module Alumni
	module Options
		def require_ops ops, keys
			keys = keys - ops.keys
			raise "Missing option(s): #{keys.join(', ')}!" unless keys.empty?
		end

		def default_ops ops, defaults
			ops.update defaults do |k, v|
				v
			end
		end
	end
end