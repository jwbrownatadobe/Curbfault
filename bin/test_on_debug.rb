require 'webrick'
class ::WEBrick::HTTPServer ; def access_log(config, req, res) ; end ; end
class ::WEBrick::BasicLog ; def log(level, data) ; end ; end

require 'curl'

def test_on_debug
  server = WEBrick::HTTPServer.new( :Port => 9999 )
  server.mount_proc("/test") do|req,res|
    res.body = "hi"
    res['Content-Type'] = "text/html"
  end
puts 'a'
  thread = Thread.new(server) do|srv|
    srv.start
  end
puts 'b'
  c = Curl::Easy.new('http://localhost:9999/test')
  c.on_debug do|x|
    puts x.inspect
  end
  c.perform
puts 'c'
ensure
  puts 'd'
  server.shutdown
  puts 'e'
  puts thread.exit
  puts 'f'
end

test_on_debug
