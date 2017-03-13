class AddClickcountDefaultVal < ActiveRecord::Migration
	def change
		remove_column :urls, :click_count, :integer
		add_column :urls, :click_count, :integer, :default => 0
	end
end
