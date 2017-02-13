class RenameUrls < ActiveRecord::Migration
	def change
		rename_table :Urls, :urls
	end
end
