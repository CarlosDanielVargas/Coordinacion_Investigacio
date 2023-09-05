class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :title
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
