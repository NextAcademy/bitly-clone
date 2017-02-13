class RenameTableUrls < ActiveRecord::Migration
	def change
		rename_table :url, :Urls
		rename_column :Urls, :original, :long_url
		rename_column :Urls, :shortened, :short_url
	end
end