class CreateBitlyUrlTable < ActiveRecord::Migration
	def change
		create_table :urls do |t|
			t.string :links
			t.string :serial_code

			t.timestamps
		end
	end
end
