get '/' do
  @data = Url.all
  erb :"static/index"
end

post '/shorten_url' do
  url = Url.new(params)
  url.save
  @new_url = "Your new url is " + "http://localhost:9393/" + url.short_url
  redirect '/'
end

get '/:short_url' do
  object = Url.where(short_url: params[:short_url])
  redirect "http://" + object[0].long_url
end
