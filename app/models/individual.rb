class Individual < ApplicationRecord
  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  # Callbacks
  before_create { self.email = email.downcase }
  before_create { self.id_card = id_card.strip }
  after_initialize :set_default_type, if: :new_record?

  # Associations
  has_many :project_investigators
  has_many :projects, through: :project_investigators
  has_many :requests, dependent: :destroy

  # Enum
  enum individual_type: [:Investigador, :Solicitante]

  # Methods
  def to_s
    "#{first_name} #{last_name} (#{id_card})"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  private
  def set_default_type
    self.individual_type ||= :Investigador
  end
end
