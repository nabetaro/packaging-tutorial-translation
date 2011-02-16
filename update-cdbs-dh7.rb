#!/usr/bin/ruby -w

require 'date'

system("scp lintian.debian.org:~cjwatson/dhstats.txt .")
f = File::new("cdbs-dh7.txt", 'w')
f.puts "date dh dh7 cdbs"
IO::read("dhstats.txt").split(/\n\n/).each do |par|
  par.strip!
  next if par == "Sun Sep 20 00:29:01 UTC 2009"
  lines = par.split(/\n/)
  date = Date::parse(lines[0]).to_s
  dh = lines.grep(/^debhelper: /)[0].split[2].gsub(/[\(\)\%]/,'').to_f
  dh7 = lines.grep(/^dh\(1\): /)[0].split[2].gsub(/[\(\)\%]/,'').to_f
  cdbs = lines.grep(/^CDBS: /)[0].split[2].gsub(/[\(\)\%]/,'').to_f
  f.puts "#{date} #{dh - dh7 - cdbs} #{dh7} #{cdbs}"
end
f.close
