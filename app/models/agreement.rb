class Agreement < ApplicationRecord
     belongs_to :article
     has_many :transaction, dependent: :destroy
     validates :agreementNumber, presence: true, uniqueness: true
     validates :articleNumber, presence: true
end
