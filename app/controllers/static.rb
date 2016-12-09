enable :sessions

get '/' do
  erb :"static/index"
end

post '/shorten_url' do
  url = Url.new(params)
  if url.save
    url.to_json
  else
    error = "Not a valid URL"
  end
end

get '/:short_url' do
  object = Url.where(short_url: params[:short_url])
  object[0].counter = object[0].counter.to_i + 1
  object[0].save
  redirect "http://" + object[0].long_url
end

post '/list_url' do
  data = Url.all.last(5).reverse
  data.to_json
end