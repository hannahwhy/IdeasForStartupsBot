require 'twitter'
require 'yaml'

config = YAML.load(File.read(File.expand_path('../twitter_config.yml', __FILE__)))

client = Twitter::REST::Client.new do |c|
  c.consumer_key = config['api_key']
  c.consumer_secret = config['api_secret']
  c.access_token = config['access_token']
  c.access_token_secret = config['access_token_secret']
end

tweet = `ruby gen.rb`.chomp

puts tweet
client.update(tweet)
