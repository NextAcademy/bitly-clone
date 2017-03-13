require 'securerandom'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :link, presence: {message: 'URL required'}
	validates :link, uniqueness: {message: 'URL already exists'}
	validate :check_uri_validity
	before_create :init_serialcode
	def check_uri_validity
		if URI.parse(URI.escape(self.link)).host.nil?
			errors.add(:link, 'Invalid URL entered')
		end
	end
	
	def init_serialcode
		begin
			serial_code = SecureRandom.hex(3)
		end while Url.where(serial_code: serial_code).exists?
		self.serial_code  = serial_code
	end
	
end
