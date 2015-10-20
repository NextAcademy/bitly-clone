class CreateUrls < ActiveRecord::Migration
	def change
    create_table :urls do |t|
      t.text :long_url
      t.text :shorten_url
      t.timestamps null: false
    end
	end
end
