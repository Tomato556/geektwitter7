class AddImageToRelaxes < ActiveRecord::Migration[6.1]
  def change
    add_column :relaxes, :image, :string
  end
end
