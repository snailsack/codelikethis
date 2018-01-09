require './app'
require 'coderay'
require 'rack/codehighlighter'
require 'rack/rewrite'

use Rack::ShowExceptions
use Rack::ShowStatus

# https://github.com/jtrupiano/rack-rewrite
use Rack::Rewrite do
  moved_permanently '/lessons/learn_to_code/learn_to_code', '/lessons/learn_to_code/intro'
  moved_permanently '/lessons/ruby_advanced/intro', '/lessons/ruby/ruby_for_programmers'
  moved_permanently '/lessons/ruby/intro', '/lessons/ruby/ruby_for_programmers'

  moved_permanently %r{/lessons/ruby_advanced/(\w+)}, '/lessons/ruby/$1'
end

use Rack::Codehighlighter, :coderay,
    :element => "pre>code",
    :markdown => true,
    :pattern => /\A[:@]{3}\s?(\w+)\s*(\n|&#x000A;)/i

run Rack::Cascade.new([
                        App,
                        Deck::RackApp.build([])
                      ])
