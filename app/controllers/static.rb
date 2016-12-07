get '/' do
  @data = Url.all.last(5).reverse
  erb :"static/index"
end

post '/shorten_url' do
  url = Url.new(params)
  if url.save
    @new_url = "Your new url is " + "http://localhost:9393/" + url.short_url
    redirect '/'
  else
    @new_url = "Not a valid URL"
    redirect '/'
  end

  get '/:short_url' do
    object = Url.where(short_url: params[:short_url])
    object[0].counter = object[0].counter.to_i + 1
    object[0].save
    redirect "http://" + object[0].long_url
  end
