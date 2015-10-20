class Url < ActiveRecord::Base
  before_create :shorten

  def shorten
    alpha = ("A".."Z").to_a.sample(5)
    num = (1..9).to_a.sample(2)

    self.shorten_url =  "#{alpha.join}" + "#{num.join}"
  end
	# This is Sinatra! Remember to create a migration!
end
