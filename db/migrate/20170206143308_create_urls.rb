class CreateUrls < ActiveRecord::Migration
	def change
	create_table :urls do |t|
      t.string :longUrl
      t.string :shortUrl
      t.integer :countClick, :default=>0
      t.timestamps

  		end
	end
end
