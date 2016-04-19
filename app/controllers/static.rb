

get '/' do
  erb :"static/index"
end

post '/urls' do
  url1 = Url.shorten
  @url2 = Url.new(long: params[:long_url], short: url1)
  if @url2.save == true
  @url = Url.create(long: params[:long_url], short: url1)
  erb :"static/index" 
  else
  	redirect 'error'
  end
end

get '/error' do
	@url
	erb :"static/index2"
end

get '/:short_url' do
	a = Url.all
	b = a.find_by(short: params[:short_url])
		count = b.counter.to_i
		count += 1
		b.counter = count
		b.save
	redirect b.long
end

