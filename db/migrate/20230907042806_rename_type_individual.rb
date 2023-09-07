class RenameTypeIndividual < ActiveRecord::Migration[7.0]
  def change
    rename_column :individuals, :type, :individual_type
  end
end
