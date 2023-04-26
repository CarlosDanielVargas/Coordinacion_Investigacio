class CreateAgreements < ActiveRecord::Migration[7.0]
  def change
    create_table :agreements do |t|
      t.string :code, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
