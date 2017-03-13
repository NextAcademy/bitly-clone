class RenameSerialCodeColumn < ActiveRecord::Migration
	def change
		rename_column :urls, :serial_code, :serial_codes
	end
end
