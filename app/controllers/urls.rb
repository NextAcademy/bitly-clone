require 'byebug'

post '/urls' do #create a new URL
# byebug
 # Url.create(long_url: params[:url][:long])
 @url = Url.new(long_url: params[:long_url])
# byebug
  if @url.save
    redirect '/'
  else
    @urls = Url.all
    @failed = true

    erb :'static/index'
    # redirect "", url.errors: "INVALID"
  end

# byebug

end

get '/urls' do
  redirect '/'
end

get '/:short_url' do #redirect to appropriate "long" URL
  # puts "[LOG] Getting /:short_url"
  # puts "[LOG] Params: #{params.inspect}"
  url = Url.find_by(shorten_url: params[:short_url])
  url.count
# byebug
  # url.click_count += 1
  # url.save
  redirect "#{url.long_url}"

end

#git testing...hahaha
