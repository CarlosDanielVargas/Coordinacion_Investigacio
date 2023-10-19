class RenameInvestigatorToIndividual < ActiveRecord::Migration[7.0]
  def change
    rename_table :investigators, :individuals
    add_column :individuals, :type, :integer, default: 0
  end
end
