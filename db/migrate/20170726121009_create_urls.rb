class CreateUrls < ActiveRecord::Migration[5.0]
	def change
		create_table :urls do |t| #we just created a new table called "urls"
			t.string :long_urls #we created a new column of strings called long_urls
			t.string :short_urls #we created a new column of strings called short_urls
			t.timestamps #we created a new column called t.timestamps which automatically creates two new columns: one is created_at and one called updated_at
		end
	end
end
