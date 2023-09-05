class AddDatesToMinute < ActiveRecord::Migration[7.0]
  def change
    remove_column :minutes, :date
    add_column :minutes, :creation_date, :date
    add_column :minutes, :acceptation_date, :date
  end
end
