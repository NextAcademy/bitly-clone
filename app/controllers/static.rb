require 'pp'



get '/' do
	puts "[LOG] Getting /"
	puts "[LOG] Params: #{params.inspect}"
  @urls = Url.all
  @alert_msg = ""

  erb :"static/index"

end

post '/urls' do
	# create a new Url
	# p params[:url]
	# p long_url = params[:url][:long]
	
	# @new_url = Url.create params[:url]
	# @urls = Url.all

	if Url.valid_url?(params[:url][:long])
		@new_url = Url.new(params[:url])
	  if @new_url.save 
	  	@alert_msg = ""  	
	  else
	  	p @new_url.errors.messages
	  	@alert_msg = "There is a problem with your link"
  	end

	else
	  	@alert_msg = "'#{params[:url][:long]}'' is not a valid URL."
	end

  @urls = Url.all
	erb :"static/index"

end

get '/:short_url' do
	# redirect to appropirate "long" URL
	# this will fetch the short_url in the table and redirect it to the long link

	p params[:short_url]

	# ori_link = Url.where(short: params[:short_url])
	# if ori_link.valid?
	# 	p "horraaay"
	# else
	# 	p "OH nooo"
	# end

	if Url.where(short: params[:short_url]).count(:id) > 0
		ori_link = Url.where(short: params[:short_url]).first

		ori_link.add_click_count
		ori_link.save

		redirect to("http://" + ori_link.long)
	else
		@urls = Url.all
		@alert_msg = "invalid short url"

		#redirect to('/')

		erb :"static/index"
	end

end