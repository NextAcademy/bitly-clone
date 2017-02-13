class CreateUrls < ActiveRecord::Migration
	def change
		create_table :url do |t|
			t.string :original
			t.string :shortened
			t.timestamps
		end
	end
end