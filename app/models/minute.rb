class Minute < ApplicationRecord
    validates :number, presence: true
    validates :date, presence: true

    has_one_attached :file
    has_many :articles, dependent: :destroy
    has_many :projects, through: :articles
    has_many :agreements, through: :articles
    has_many :transaction_records, through: :agreements
    has_many :notices, through: :transaction_records
    has_many :project_investigators, through: :projects
    has_many :individuals, through: :project_investigators

    accepts_nested_attributes_for :articles, allow_destroy: true, reject_if: proc { |attr| attr["code"].blank? }

    def self.ransackable_attributes(auth_object = nil)
        ['project_id_eq', 'number_eq', 'investigator_id_eq']
    end

    def self.ransackable_associations(auth_object = nil)
        ["project", "individual"]
    end

    def to_s
        "#{self.number} - #{self.date}"
    end
end
