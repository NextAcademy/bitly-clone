

get '/' do
  erb :"static/index"
end

post '/urls' do
  url1 = Url.shorten
  @url = Url.create(long: params[:long_url], short: url1)
  erb :"static/index"
 
end

get '/:short_url' do
	a = Url.all
	b = a.find_by(short: params[:short_url])
	redirect "http://" + b.long
end