class TransactionRecord < ApplicationRecord
    belongs_to :agreement
    belongs_to :article
    belongs_to :minute
    has_many :notices, dependent: :destroy
    accepts_nested_attributes_for :notices, allow_destroy: true, reject_if: proc { |attr| attr["code"].blank? }

    enum status: [:Pendiente, :Finalizado, :En_Ejecución]

    validates :status, presence: true
    
    after_initialize :set_default_status, if: :new_record?

    def set_default_status
        self.status ||= :Pendiente
    end

end
