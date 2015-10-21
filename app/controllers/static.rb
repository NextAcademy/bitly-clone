get '/' do
  @urls = Url.all.order(click_count: :desc)
  erb :"static/index"

end