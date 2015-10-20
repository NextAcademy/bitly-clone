require 'byebug'

post '/urls' do #create a new URL
# byebug
 # Url.create(long_url: params[:url][:long])
 Url.create(long_url: params[:long_url])
 redirect '/'
end

get '/:short_url' do #redirect to appropriate "long" URL
  # puts "[LOG] Getting /:short_url"
  # puts "[LOG] Params: #{params.inspect}"
  url = Url.find_by(shorten_url: params[:short_url])
  redirect "#{url.long_url}"
end

