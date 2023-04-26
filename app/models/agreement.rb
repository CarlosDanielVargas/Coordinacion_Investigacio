class Agreement < ApplicationRecord
     belongs_to :article
     has_many :transactions, dependent: :destroy

     accepts_nested_attributes_for :transactions, allow_destroy: true
end
