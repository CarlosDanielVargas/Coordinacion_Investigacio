class ChangeNulleableToNotNulleableCollumns < ActiveRecord::Migration[7.0]
  def change
    change_column_null :project_investigators, :project_id, false
    #change_column_null :project_investigators, :investigator_id, false
    change_column_null :minutes, :creation_date, false
    change_column_null :notices, :code, false
    change_column_null :articles, :minute_id, false
    change_column_null :articles, :project_id, false
    change_column_null :agreements, :article_id, false
    change_column_null :individuals, :id_card, true
    change_column_null :transaction_records, :agreement_id, false
  end
end
