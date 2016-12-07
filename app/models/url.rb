require 'open-uri'

class Url < ActiveRecord::Base
  # This is Sinatra! Remember to create a migration!
  validates :long_url, presence: true, format: { with: /^(http|https|ftp|ftps):\/\/(([a-z0-9]+\:)?[a-z0-9]+\@)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix }

  before_create :create_alphanumeric, :set_counter

  def create_alphanumeric
    alpha_numeric_array = ("A".."Z").to_a + ("a".."z").to_a + ("1".."9").to_a
    new_url = ""
    6.times do
      new_url += alpha_numeric_array.sample
    end
    self.short_url = new_url
  end

  def set_counter
    self.counter = 0
  end

end
