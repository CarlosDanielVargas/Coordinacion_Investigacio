class Project < ApplicationRecord
  validates :name, presence: true
  
  has_many :project_investigators, dependent: :destroy
  has_many :investigators, through: :project_investigators
  
  has_many :articles, dependent: :destroy
  has_many :minutes, through: :articles

  accepts_nested_attributes_for :project_investigators, reject_if: ->(attributes) { attributes["name"].blank? }, allow_destroy: true

  def investigators_roles
    self.project_investigators.map { |pi| [pi.full_name, pi.role] }
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name", "preAcceptanceCode", "finalCode"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["project_investigators"]
  end

  def get_main_investigator
    return "--" if self.project_investigators.empty?
    inv = self.project_investigators.find_by(role: "principal")
    inv = Investigator.find_by(id: inv.investigator_id)
  end
end
