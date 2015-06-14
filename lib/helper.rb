module Alumni
	module Helpers
		def link_css path
			%{<link rel="stylesheet" type="text/css" href="#{path}" />} 
		end

		def script_js path
			%{<script type="text/javascript" src="#{path}"></script>}
		end

		def input name, x, y, placeholder = name
			%{<input class="box" type="text" name="#{name}" id="#{name}" placeholder="#{placeholder}" style="left:#{x}px;top:#{y}px"/>}
		end

		def boxes setting
			outs = setting.map do |(k, box)|
				input k, box[:x], box[:y]
			end
			outs.join '\n'
		end
	end
end