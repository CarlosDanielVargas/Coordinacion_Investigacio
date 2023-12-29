class Agreement < ApplicationRecord
     belongs_to :article
     belongs_to :minute
     has_many :transaction_records, dependent: :destroy
     has_many :notices, through: :transaction_records

     accepts_nested_attributes_for :transaction_records, allow_destroy: true
end
