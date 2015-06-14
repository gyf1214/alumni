require_rel 'helper'

module Alumni
	class Application < Sinatra::Application
		helpers Helpers
		set :public_folder, 'public'

		get '/alumni' do
			haml :index	
		end
	end
end