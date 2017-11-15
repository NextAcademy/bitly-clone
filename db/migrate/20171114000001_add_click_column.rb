class AddClickColumn < ActiveRecord::Migration[5.0]
	def change
		add_column :urls, :click_count, :integer, default: 0
		# create_table :urls do |x|

		# 	x.string :ori_url
		# 	x.string :short_url


		# 	x.timestamp 
		# end
	end
end
