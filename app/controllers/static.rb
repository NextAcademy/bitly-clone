require 'byebug'

get '/' do
	# let user create new short URL, display a list of shortened URLs

 	
  @result = Url.all
  erb :"static/index"

end

post '/urls' do
  
  # create a new Url

  url = Url.new()
  url.longUrl = params[:long_url] 
  url.shortUrl = url.shorten

  if url.save
  
  	url.to_json
  else

  	@error = url.errors.messages[:longUrl]
 #   	@result = Url.all

	# erb :"static/index"
	 #redirect "/"
	end


 
end

# i.e. /q6bda
get '/:shortUrl' do
  # redirect to appropriate "long" URL
  
  url = Url.find_by(shortUrl: params[:shortUrl])
  to_page = url.longUrl
  url.countClick += 1
  url.save
  redirect to_page
end