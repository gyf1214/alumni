module Alumni
	module Helpers
		def link_css path
			%{<link rel="stylesheet" type="text/css" href="#{path}" />} 
		end

		def script_js path
			%{<script type="text/javascript" src="#{path}"></script>}
		end

		def input_box name, x, y, placeholder = name
			%{<input class="box" type="text" name="#{name}" id="#{name}" placeholder="#{placeholder}" style="left:#{x}px;top:#{y}px"/>}
		end

		def input name, placeholder = name
			%{<input class="typical" type="text" name="#{name}" id="#{name}" placeholder="#{placeholder}"/>}
		end

		def boxes setting
			outs = setting.map do |(k, box)|
				input_box k, box[:x], box[:y]
			end
			outs.join '\n'
		end
	end
end