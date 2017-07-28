class Url < ActiveRecord::Base
  validates :long_urls, uniqueness: true
  validates :long_urls, format: {with: (URI::regexp(['http', 'https'])), message: "Entrered URL is Invalid!"}
	# This is Sinatra! Remember to create a migration!
  #above validatesusing the "validates at lines 2 & 3"
end
