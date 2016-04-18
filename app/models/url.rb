
class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	def self.shorten
		letters_array = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U W X Y Z 1 2 3 4 5 6 7 8 9 0)
		random_selection = letters_array.sample(6)
		new_url = random_selection.join('')
	end
end
