class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	validates :ori_url, presence: true
	validates :short_url, :ori_url, uniqueness: true
	validates :ori_url, format: {with: /(((ftp|http|https):\/\/)|(\/)|(..\/))(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/, message: "valid URLs only"}
	
	def self.shorten
		x = [*('A'..'Z'),*('a'..'z'),*('0'..'9')].shuffle[0,5].join
		return x
	end

end
