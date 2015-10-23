get '/' do
	@urls = Url.all.order("click_count DESC")
  	erb :"static/index", :layout => :"static/layout"
end

post '/urls' do
	search_long_url = Url.find_by(long_url: params[:long_url])
	if search_long_url.nil?
		url = Url.new(long_url: params[:long_url])
			if url.save
				redirect to '/'
			else
					erb :"static/error"
			end
	else
		redirect to '/'
	end
end

get '/:short_url' do
	@url = Url.find_by(short_url: params[:short_url])
	@url.click_count += 1
	@url.save
	redirect to @url.long_url
end

# get '/new_page' do
# 	@url = Url.find_by(short_url: params[:short_url])
# 	@url.click_count += 1
# 	@url.save
# 	redirect to @url.long_url
# end


# post '/clicks/:id' do
# 	url = Url.find(params[:id])
# 	url.update(:click_count, @url.click_count + 1)
# end