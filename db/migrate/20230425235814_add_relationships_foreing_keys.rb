class AddRelationshipsForeingKeys < ActiveRecord::Migration[7.0]
  def change

    change_table :articles do |t|
      t.references :minute, foreign_key: true
      t.references :project, foreign_key: true
    end

    change_table :agreements do |t|
      t.references :article, foreign_key: true
    end

    change_table :project_investigators do |t|
      t.references :project, foreign_key: true
      t.references :investigator, foreign_key: true
    end

    change_table :transactions do |t|
      t.references :agreement, foreign_key: true
    end
  end
end
