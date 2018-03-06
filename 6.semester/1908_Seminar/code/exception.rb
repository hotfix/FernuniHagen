begin
  datei = File.open("text_datei.txt","r")
rescue Errno::ENOENT
  puts "Fehler beim lesen der Datei "
rescue => e
  puts "Fehler beim lesen der Datei " + e.to_s
ensure
  datei.close if datei
end

