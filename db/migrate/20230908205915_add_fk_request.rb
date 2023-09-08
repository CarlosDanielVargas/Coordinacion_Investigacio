class AddFkRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :individual_id, :integer, null: false
    add_foreign_key :requests, :individuals
    add_index :requests, :individual_id
  end
end
