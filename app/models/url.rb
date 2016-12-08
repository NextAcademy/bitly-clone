

class Url < ActiveRecord::Base

before_create :shorten

validates :short_url, uniqueness: { allow_nil: true }
validates :long_url, presence: true, format: { with: URI::regexp, message: 'please enter a valid url' }


def shorten
	self.short_url = [*('0'..'9'),*('A'..'z')].to_a.shuffle[0,7].join
	until self.valid?
		self.short_url = [*('0'..'9'),*('A'..'z')].to_a.shuffle[0,7].join
	end
end

end
