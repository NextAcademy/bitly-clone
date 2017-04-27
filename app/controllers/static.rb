@error = []

get '/' do
  @list = Url.order(created_at: :desc)
  erb :"static/index"
end


post '/urls' do
  url = Url.new()
  url.long_url  = params[:long_url]
  url.short_url = url.shorten
  if url.save
    url.to_json

  else
    {response:'Error'}.to_json
  end
end

get '/:short_url' do
  url = Url.find_by(short_url: params[:short_url])
  to_page = url.long_url
  url.click_count += 1
  url.save
  redirect to_page
end
  # redirect to appropriate "long" url
