class AddFkRequestArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :request_id, :integer, null: true
    add_foreign_key :articles, :requests
    change_column_null :articles, :project_id, true
  end
end
