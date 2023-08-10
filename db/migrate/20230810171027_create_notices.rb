class CreateNotices < ActiveRecord::Migration[7.0]
  def change
    create_table :notices do |t|
      t.string :code
      t.references :transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
