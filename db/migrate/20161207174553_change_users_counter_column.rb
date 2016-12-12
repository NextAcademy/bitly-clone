class ChangeUsersCounterColumn < ActiveRecord::Migration
	def change
		remove_column :urls, :counter, :string
		add_column :urls, :counter,: :interger
	end
end
