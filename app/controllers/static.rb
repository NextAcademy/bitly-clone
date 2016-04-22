

get '/' do
  @uri = Url.all.order(updated_at: :asc).limit(10)
  erb :"static/index"
end

post '/urls' do

# url1 = Url.shorten

	text = params[:long_url]
	regex = (/\(?(?:(http|https):\/\/)/)
  	
  if text.match(regex)
  		params[:long_url] 
  	else
  		params[:long_url] = "http://" + params[:long_url]
  end
    
  	@url = Url.create(long: params[:long_url])
  	if @url.save 

  		 @url
  	erb :"static/index" 
  	else
  		@url=nil
  		@urll = true
  	erb :"static/index"
  	end

@uri = Url.all.order(updated_at: :asc).limit(10)
end

get '/list' do
	@uri = Url.all.order(updated_at: :asc).limit(10)
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
		b.update(counter: count, updated_at: DateTime.now)
	redirect b.long
end

