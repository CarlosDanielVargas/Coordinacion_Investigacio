class Notice < ApplicationRecord
  belongs_to :transaction_record
  belongs_to :minute
  belongs_to :agreement
  belongs_to :article
  has_one_attached :file
end
