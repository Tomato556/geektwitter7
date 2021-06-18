class CreateLoves < ActiveRecord::Migration[6.1]
  def change
    create_table :loves do |t|
      t.references :relax, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
