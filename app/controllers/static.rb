get '/' do
  erb :"static/index"
end

get '/urls' do
	redirect '/'
end

get '/howto' do
	erb :'static/howto'
end

get '/about' do
	erb :'static/about'
end

post '/urls' do
	new_url = Url.new
	new_url.link = params[:long_url].to_s
	new_url.serial_code = new_url.shorten
	new_url.click_count = 0
	if new_url.save
		new_url.to_json
	else
		{error: 'Invalid URL'}.to_json
	end
	# @error_messages = new_url.errors
	# erb :'static/index'
end

get '/:serial_code' do
	url_record = Url.find_by(serial_code: params[:serial_code])
	url_record.increment!(:click_count)
	long_url = url_record.link
	redirect long_url
end