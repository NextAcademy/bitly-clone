get '/' do
	erb :"static/index"
end

# #2 save long and short urls into database
post '/url' do
	#create new row of data with long url
	#AR callback will auto run shorten
	url = Url.new(params)
	url.save
	redirect to("/")
  #OR erb :"static/index" #render
end

# #3a redirect to actual page
# get '/:short_url' do
# 	#find row of short url associated to long url
# 	long_url = Url.find_by(short_url: params['short_url']).long_url
# 	redirect to long_url
# end


#3b redirect to actual page & add counter
get '/:short_url' do
	#find row of short url associated to long url
	url = Url.find_by(short_url: params['short_url'])
	url.click_count += 1
	url.save
	redirect to url.long_url
end




