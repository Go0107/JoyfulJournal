class AddUserIdToJournals < ActiveRecord::Migration[7.0]
  def change
    add_column :journals, :user_id, :integer
  end
end
