require 'URI'
require 'securerandom'


class Url < ActiveRecord::Base
	before_create :shorten
	# validates :longUrl, uniqueness: true
	# validates :longUrl, presence:{ message:"nothing inside sorry, i need an url!"}
 	# validates :longUrl, :format => { :with => /"@^(https?|ftp)://[^\s/$.?#].[^\s]*$@iS"/,
	 #     :message => "Enter a valid url, please!"}
	#validates :longUrl, :check_validation
	validates_format_of :longUrl, :with => URI::regexp(%w(http https)), :message => "Enter a valid url, please!"


 	def check_validation
 		# p = URI::Parser.new(:ESCAPED => "(?:%[a-fA-F0-9]{2}|%u[a-fA-F0-9]{4})")
		# u = p.parse(params[:longUrl])
		# URI.parse(u.to_s)
 	end

	# This is Sinatra! Remember to create a migration!



	def shorten
		# range_alpha = [*"A".."Z",*"a".."z"]
		# range_int = [*"0".."9"]
		# short_url = (0...3).map{ range_alpha.sample }.join('') 
		# short_url2 = (0...4).map{range_int.sample}.join('')

		# return short_url + short_url2
		return SecureRandom.hex(3)
	end
end
