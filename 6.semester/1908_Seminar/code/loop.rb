
filename = "example.txt"
file = File.open(filename, "w")
i = 0
loop do
  line = gets

  # Nächste Zeile, wenn länger als 20 Zeichen
  next if line.chomp.length > 20

  break if i > 10 or line.chomp == "EOF"
  file.puts line.chomp
  i += 1
end
file.close