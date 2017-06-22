#!/usr/bin/ruby
begin
    out_file = File.new(ARGV[0], "w")
    out_file.puts("#{ARGV[1]}")
    out_file.close
rescue
puts "error"
end

