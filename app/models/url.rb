require 'securerandom'
require 'validate_url'

class Url < ActiveRecord::Base
validates :long_url, presence: true,
                    format: { with: /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/, :multiline => true,
                                 message: "Not a valid URL"}
validates :long_url, :url => true
  def shorten
      short = SecureRandom.hex(3)
      short
  end
end
