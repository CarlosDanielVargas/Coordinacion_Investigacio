class TransactionRecord < ApplicationRecord
    # Associations
    belongs_to :agreement
    has_many :notices, dependent: :destroy
    accepts_nested_attributes_for :notices, allow_destroy: true, reject_if: proc { |attr| attr["code"].blank? }

    # Enum
    enum status: [:Pendiente, :Finalizado, :'En proceso']

    # Validations
    validates :status, presence: true

    # Callbacks
    after_initialize :set_default_status, if: :new_record?

    # Methods
    def to_s
        "#{self.article.code} - #{self.article.name}"
    end

    private
    def set_default_status
        self.status ||= :Pendiente
    end

end
