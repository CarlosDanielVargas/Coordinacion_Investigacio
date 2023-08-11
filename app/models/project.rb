class Project < ApplicationRecord
  validates :name, presence: true
  
  has_many :project_investigators
  has_many :investigators, through: :project_investigators
  has_many :articles, dependent: :destroy
  has_many :minutes, through: :articles

  accepts_nested_attributes_for :project_investigators, reject_if: ->(attributes) { attributes["name"].blank? }, allow_destroy: true

  def investigators_roles
    self.project_investigators.map { |pi| [pi.full_name, pi.role] }
  end

end
