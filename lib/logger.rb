module Alumni
	module Logger
		Levels = [:debug, :info, :warn, :fatal]
		Out = STDERR
		@on = Array.new

		Levels.each do |l|
			self.instance_eval %{
				def #{l} sth
					Out.puts "[#{l} \#{Time.now}]\#{sth}" if @on.include? :#{l}
				end
			}
		end

		def self.on *l
			@on.push *l
		end

		def self.off l
			l.each do |x|
				@on.delete x
			end
		end

		on :info, :warn, :fatal
	end
end