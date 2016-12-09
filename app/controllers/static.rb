require 'byebug'

get '/' do
	erb :"static/index"
end

# #2 save long and short urls into database
post '/url' do
	#create new row of data with long url
	#AR callback will auto run shorten
	url = Url.new(params)

	if url.save
		url.to_json
	else
		status 400
		url.errors.messages[:long_url][0]
	end
	# redirect '/'
	# erb :"static/index"
	# erb :"static/index" #render
  #OR redirect to '/' (but error msg will not show) 
end

#3 redirect to actual page & add counter
get '/:short_url' do
	#find row of short url associated to long url
	url = Url.find_by(short_url: params['short_url'])
	url.click_count += 1
	url.save
	redirect to url.long_url
end




