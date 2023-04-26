class CreateMinutes < ActiveRecord::Migration[7.0]
  def change
    create_table :minutes do |t|
      t.integer :number, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
