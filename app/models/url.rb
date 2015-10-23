# require_relative '../../config/database'
# require_relative '../../config/environment'
require 'securerandom'
require 'byebug'

class Url < ActiveRecord::Base
	validates :long_url, presence: true, format: {with: /(http(s?):\/\/)(.*)/}
	before_create :shorten
	
	def shorten
		short_rand = "www." + SecureRandom.base64(1) + ".com"
		self.short_url = short_rand
	end 
end
