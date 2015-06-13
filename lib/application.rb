module Alumni
	class Application < Sinatra::Application
		set :public_folder, 'public'

		get '/alumni' do
			erb :index	
		end
	end
end