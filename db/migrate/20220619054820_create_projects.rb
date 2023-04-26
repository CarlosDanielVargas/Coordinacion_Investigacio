class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :preAcceptanceCode
      t.string :finalCode
      t.string :name, null: false

      t.timestamps
    end
  end
end
