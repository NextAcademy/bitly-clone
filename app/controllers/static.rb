get '/' do
	# @url = Url.all
	puts "[LOG] Getting /"
	puts "[LOG] Params: #{params.inspect}"
  erb :"static/index"
end

post '/urls' do
	
	Url.create(ori_url:params[:long_url], short_url: Url.shorten)
	# byebug
	# @url = Url.all
	redirect '/'

end 

get '/:short_url' do
	short = params[:short_url]
	x = Url.find_by(short_url:short)
	# byebug
	x.update(click_count:x.click_count+1) 
	redirect x.ori_url
end	