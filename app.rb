require 'sinatra'
require "sinatra/json"
require 'json'

get '/sample.json' do
  json get_json("response/sample.json")
end

get '/date' do
  now = Time.new
  data = {date: now.strftime("%H:%M:%S")}
  json data
end

get '/wol' do
  res = `wol -i 192.168.3.255 74:d0:2b:90:08:07`
  data = {data: res.to_s}
  json data
end

def get_json(path)
  File.open(path) do |file|
    JSON.load(file)
  end
end
