require 'securerandom'

get '/' do
  @urls = Url.all.order("created_at DESC")
  erb :"static/index"
end

post '/shorten' do
  @url = Url.new(long_urls: params["long_urls"], short_urls: SecureRandom.hex(4))
   #creates a ew object called @url then using the short_urls: SecureRandom.hex(4) this generates a secure random output that has a lower probability of redundancy.
   if @url.save
  # p params
  # "example"
  redirect '/' #redirects the user back to the 'root' or main web page
else #i need my code to rememeber my error variable when its not saved successfully, thats why i load the erb instead of redirecting to "/" because once i do reidrecting to '/' my code will forget the defiend local variable
  #this is the error message given from ActiveRecord because it does not pass the validation stated on m odel urb
  @errors = @url.errors.full_messages.join(",")
end
  @urls = Url.all.order("created_at DESC")
  erb :"static/index"
end

post '/:url_id/vote' do
  # whatever you see on the browser is the value, and then the key i set to id by inserting : here
  # 1-find out which url i am upvoting
  @url = Url.find(params[:url_id])

  @url.click_count +=1
  @url.save
  redirect '/'

end

get '/:shortshort' do
  #1 look for this url now
  #2 increase the lick count because ijust clicked on the short url
  #3 i will redirect to the l;ong url (original website)
  #look for this url now
  @url = Url.find_ny(short_urls: params[:shortshort])
  @url.click_count +=1
  @url.save
  rediirect to "#{@url.long_urls}"
end

post "/test" do
  @url = Url.new(long_urls: params[:long_urls], short_urls: SecureRandom.hex(4))
  @url.save
  @url.to_json
end
