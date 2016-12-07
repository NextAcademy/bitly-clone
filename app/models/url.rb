class Url < ActiveRecord::Base
  # This is Sinatra! Remember to create a migration!
  validates :long_url, uniqueness: true

  before_create :create_alphanumeric

  def create_alphanumeric
    alpha_numeric_array = ("A".."Z").to_a + ("a".."z").to_a + ("1".."9").to_a
    new_url = ""
    6.times do
      new_url += alpha_numeric_array.sample
    end
    self.short_url = new_url
  end

end
