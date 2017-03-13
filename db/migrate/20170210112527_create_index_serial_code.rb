class CreateIndexSerialCode < ActiveRecord::Migration
	def change
		add_index :urls, [:serial_code], unique: true
	end
end
