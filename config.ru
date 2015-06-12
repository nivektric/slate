require 'rack'
require 'rack/contrib/try_static'


# This is a snippet to add to middleman's config.ru file if you want to add basic auth to your middleman app on heroku
# NOTE: you need to stick this above the build script like shown below

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  [username, password] == ['username', 'password']
end

# Serve files from the build directory
use Rack::TryStatic,
    root: 'build',
    urls: %w[/],
    try: ['.html', 'index.html', '/index.html']

run lambda{ |env|
      four_oh_four_page = File.expand_path("../build/404/index.html", __FILE__)
      [ 404, { 'Content-Type'  => 'text/html'}, [ File.read(four_oh_four_page) ]]
    }