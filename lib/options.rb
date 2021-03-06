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
	end
end