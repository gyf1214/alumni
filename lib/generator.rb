require_rel 'options'
require_rel 'logger'

module Alumni
	class Generator
		include Magick
		include Options

		def initialize ops
			Logger.debug "New generator, options: #{ops.inspect}"

			require_ops ops, [:src, :settings]

			@src = Image.read(ops[:src]).first
			@brush = Draw.new

			settings = ops[:settings]
			@global = settings[:settings]
			@boxes = settings[:boxes]

			@spec = ops[:spec]
		end

		def do! texts, path
			Logger.info "Start generate #{@path}"

			@image = @src.clone
			if @spec.nil?
				render @boxes, texts
			else
				Logger.debug "Specifically render: { #{@spec} }"
				self.instance_eval @spec
			end
			save path

			Logger.info "Finish generate #{@path}"
		end

		private

		def line text, width
			lines = text.split "\n"
			outs = Array.new
			lines.each do |l|
				while lines.size > width and width > 0
					outs.push l.slice!(0, width)
				end
				outs.push l
			end
			outs
		end

		def textout txt, x, y, font = {}
			Logger.debug "Textout: #{txt.inspect}"

			@brush.annotate @image, 0, 0, x, y, txt do
				font.each do |k, v|
					self.send "#{k}=", v
				end

				self.gravity = NorthWestGravity
			end
		end

		def render boxes, texts
			Logger.debug "Normally render"

			boxes.each do |k, box|
				spec_setting = box[:settings] || {}
				setting = @global.merge spec_setting
				width = box[:width] || 0
				lines = line texts[k], width

				Logger.debug "Print section: #{k}, #{lines.size} line(s)"
				lines.each do |l|
					textout l, box[:x], box[:y], setting
				end
			end
		end

		def save path
			Logger.debug "Save to #{path}"

			@image.write path
		end
	end
end