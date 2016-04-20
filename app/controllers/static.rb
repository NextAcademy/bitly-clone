

get '/' do
  erb :"static/index"
end

post '/urls' do
  url1 = Url.shorten
  @url = Url.new(long: params[:long_url], short: url1)
  if @url.save == true
  	@url
  erb :"static/index" 
  else
  	redirect '/error'
  end
end

get '/error' do
	@url
	erb :"static/index2"
end

get '/list' do
	@uri = Url.all.sort_by {|x| x[:created_at]}.reverse
	erb :"static/index3"
end

get '/delete/:short_url' do
	a = Url.find_by(short: params[:short_url])
	a.destroy
	redirect '/list'
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

