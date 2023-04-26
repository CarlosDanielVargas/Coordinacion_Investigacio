class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :code, null: false

      t.timestamps
    end
  end
end
