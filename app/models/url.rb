require 'byebug'

class Url < ActiveRecord::Base
  before_create :shorten

  validates :long_url, presence: true, :format => {:with => URI.regexp}

  # validates :long_url, presence: true, :format => {:with => /https?:\/\/[\S]+/}#:message => "POP: Invalid URL"} attr_accessor :click_count  #never use this!!!

  def shorten
    alpha = ("A".."Z").to_a.sample(5)
    num = (1..9).to_a.sample(2)

    self.shorten_url =  "#{alpha.join}" + "#{num.join}"
  end

  def count
    # byebug
    self.click_count += 1
    self.save
  end
	# This is Sinatra! Remember to create a migration!
end
