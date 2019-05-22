get '/' do
	# @url = Url.all
	puts "[LOG] Getting /"
	puts "[LOG] Params: #{params.inspect}"
  erb :"static/index"
end

post '/urls' do
	
	i = Url.new(ori_url:params[:long_url], short_url: Url.shorten)

	if i.save
		i.to_json
		# redirect '/'
		{success: true, message: i}.to_json
	else
		@errors = i.errors.messages
		{success: false, message: (i.errors.messages)}.to_json
		# erb :'static/index'
	end


	# Url.create(ori_url:params[:long_url], short_url: Url.shorten)
	# byebug
	# @url = Url.all
	# redirect '/'

end 

get '/:short_url' do
	short = params[:short_url]
	x = Url.find_by(short_url:short)
	# byebug
	x.update(click_count:x.click_count+1) 
	redirect x.ori_url
end	