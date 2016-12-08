enable :sessions

get '/' do
  @data = Url.all.last(5).reverse
  @valid_url = session[:good_message]
  @invalid_url = session[:bad_message]
  erb :"static/index"
end

post '/shorten_url' do
  url = Url.new(params)
  if url.save
    session[:good_message] = "Your new url is " + "http://localhost:9393/" + url.short_url
    redirect '/'
  else
    session[:bad_message] = "Not a valid URL"
    redirect '/'
  end
end

  get '/:short_url' do
    object = Url.where(short_url: params[:short_url])
    object[0].counter = object[0].counter.to_i + 1
    object[0].save
    redirect "http://" + object[0].long_url
  end
