get '/' do
	@urls = Url.all.last(5)
	@total_click = Url.total_click
  erb :"static/index"
end
# let user create new short URL, display a list of shortened URLs


post '/urls' do
	@urls=Url.all.last(5)
	@url = Url.create(long_url: params[:long_url])
	@error_message = @url.errors.messages[:long_url]
	if @url.save
		# redirect to '/'
		# @url.to_json
	else
		# erb :"static/index"
		@error = "Please enter a valid URL"
		redirect to "/"
	end
	@url.to_json
end
# create a new Url


get '/:short_url' do
	@url = Url.find_by(short_url: params[:short_url])
	@url.click_count +=1
	@url.save
	redirect @url.long_url
	end

# redirect to appropriate "long" URL
