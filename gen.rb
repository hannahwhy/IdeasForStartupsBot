require 'active_support/inflector'

target = `bundle exec ruby pick-target.rb`.chomp
word = `bundle exec ruby pick-word.rb`.chomp

puts "#{target}, but for #{word}"
