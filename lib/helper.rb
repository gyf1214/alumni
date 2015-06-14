module Alumni
	module Helpers
		def link_css path
			%{<link rel="stylesheet" type="text/css" href="#{path}" />} 
		end

		def script_js path
			%{<script type="text/javascript" src="#{path}"></script>}
		end
	end
end