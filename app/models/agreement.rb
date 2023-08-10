class Agreement < ApplicationRecord
     belongs_to :article
     has_many :transaction_records, dependent: :destroy

     accepts_nested_attributes_for :transaction_records, allow_destroy: true
end
