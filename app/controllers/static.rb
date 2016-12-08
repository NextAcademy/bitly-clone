get '/' do
	erb :"static/index"
end

# #2 save long and short urls into database
post '/url' do
	#create new row of data with long url
	#AR callback will auto run shorter=n

	url = Url.new(params)
	url.save
	redirect to("/")
  #OR erb :"static/index" #render
end

#3 redirect to actual page
get '/:short_url' do
	#find row of short url associated to long url
	long_url = Url.find_by(short_url: params['short_url']).long_url
	redirect to long_url
end






