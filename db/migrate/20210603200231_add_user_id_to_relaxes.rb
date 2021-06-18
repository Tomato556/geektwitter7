class AddUserIdToRelaxes < ActiveRecord::Migration[6.1]
  def change
    add_column :relaxes, :user_id, :integer
  end
end
