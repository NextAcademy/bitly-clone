class RenameColumns < ActiveRecord::Migration
	def change
		rename_column :urls, :links, :link
		rename_column :urls, :serial_codes, :serial_code
	end
end
