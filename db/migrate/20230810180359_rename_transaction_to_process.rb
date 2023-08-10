class RenameTransactionToProcess < ActiveRecord::Migration[7.0]
  def change
    rename_table :transactions, :transaction_records
    rename_column :notices, :transaction_id, :transaction_record_id
  end
end
