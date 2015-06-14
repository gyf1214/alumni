require_rel 'helper'
require_rel 'options'

module Alumni
	class Application < Sinatra::Application
		helpers Helpers, Options
		set :public_folder, 'public'

		get '/' do
			haml :index	
		end

		get '/alumni' do
			#setting = Manager.boxes
			#haml :alumni, locals: {setting: setting}
			haml :unfinished
		end

		post '/' do
			outs = string_to_symbol params
			require_ops outs, [:ID]
			name = outs[:ID]
			outs.delete :ID
			Manager.do! name, outs
			haml :thx
		end

		get '/diy' do
			haml :diy
		end

		post '/diy' do
			outs = params
			require_ops outs, ['ID']
			name = outs['ID']
			unless params[:file] and (tempfile = params[:file][:tempfile]) and (filename = params[:file][:filename])
				raise "No file uploaded!"
			end

			Manager.upload name, params[:file][:tempfile]
			haml :thx
		end

		not_found do
			haml :nothing
		end
	end
end