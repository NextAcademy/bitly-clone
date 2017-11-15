class CreateUrls < ActiveRecord::Migration[5.0]
	def change
		create_table :urls do |x|

			x.string :ori_url
			x.string :short_url
			x.integer :click_count, default: 0

			x.timestamp 
		end
	end
end
