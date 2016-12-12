class ChangeUrls < ActiveRecord::Migration
	def change
		add_column :urls, :counter, :string
	end
end
