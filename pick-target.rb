sts = File.read('targets').split("\n")

target = sts.shift
puts target

sts += [target]

File.open('targets', 'w+') { |f| sts.each { |st| f.puts(st) } }
