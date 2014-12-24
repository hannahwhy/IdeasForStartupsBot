# Pulls a list of trending startups from angel.co, prints them to stdout.

require 'nokogiri'

links = Nokogiri.HTML(`curl https://angel.co/companies/trending`)/'a.startup-link'

puts links.map { |l| l.text.chomp }.reject(&:empty?)
