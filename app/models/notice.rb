class Notice < ApplicationRecord
  belongs_to :transaction_record
  has_one_attached :file
end
