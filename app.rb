require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/:results") do
  @square = params.fetch("user_number").to_i
  erb(:square)
end

get("/square_root/:results") do

  erb(:square_root)
end

get("/payment/:results") do

  erb(:payment)
end

get("/random/:results") do

  erb(:random)
end
