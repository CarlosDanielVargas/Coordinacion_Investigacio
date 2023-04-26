class CreateProjectInvestigators < ActiveRecord::Migration[7.0]
  def change
    create_table :project_investigators do |t|
      t.integer :role, null: false, default: 0

      t.timestamps
    end
  end
end
