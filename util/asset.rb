require './bootstrap'

include Alumni::Config
include Alumni::Config::Assets

src = File.read ARGV[1] || CssSrc
engine = Sass::Engine.new src, load_paths: [Path], cache_location: CssCache

out = engine.render

File.open CssOut, 'w' do |file|
	file.write out
end
