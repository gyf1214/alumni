module Alumni
	module Helpers
		def link_css path
			%{<link rel="stylesheet" type="text/css" href="#{path}" />} 
		end

		def script_js path
			%{<script type="text/javascript" src="#{path}"></script>}
		end

		def input_box name, x, y, placeholder
			%{<input class="box" type="text" name="#{name}" id="#{name}" placeholder="#{placeholder}" style="left:#{x}px;top:#{y}px"/>}
		end

		def input name, placeholder
			%{<input class="typical" type="text" name="#{name}" id="#{name}" placeholder="#{placeholder}"/>}
		end

		def textarea name, x, y, width, height, placeholder
			%{<textarea class="box" name="#{name}" id="#{name}" placeholder="#{placeholder}" style="left:#{x}px;top:#{y}px;width:#{width * 16}px;height:#{height * 30}px"></textarea>}
		end

		def boxes setting
			outs = setting.map do |(k, box)|
				placeholder = box[:placeholder] || k
				unless box.key? :width
					input_box k, box[:x], box[:y], placeholder
				else
					textarea k, box[:x], box[:y], box[:width], box[:height], placeholder
				end
			end
			outs.join "\n"
		end
	end
end