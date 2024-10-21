require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @number = params["number"].to_f

  if @number == @number.to_i
    @number = @number.to_i
  end

  @result = @number.to_f ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @number = params["user_number"].to_f

  if @number == @number.to_i
    @number = @number.to_i
  end

  @result = @number.to_f ** 0.5

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = params["user_apr"].to_f.round(4)
  @years = params["user_years"].to_i
  @present_value = params["user_pv"].to_f.round(2)

  monthly_rate = (@apr / 100) / 12
  
  n = @years * 12
  
  numerator = monthly_rate * @present_value
  denominator = 1 - (1 + monthly_rate) ** -n

  if denominator.zero?
    @monthly_payment = 0
  else
    @monthly_payment = numerator / denominator
  end
  @monthly_payment = @monthly_payment.to_fs(:currency)

  erb(:payment_results)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min = params["user_min"].to_f
  @max = params["user_max"].to_f

  @random_number = rand(@min..@max)

  erb(:random_results)
end
