require_rel 'helper'

module Alumni
	class Application < Sinatra::Application
		helpers Helpers
		set :public_folder, 'public'

		get '/' do
			haml :index	
		end

		get '/alumni' do
			setting = Manager.boxes
			haml :alumni, locals: {setting: setting}
		end
	end
end