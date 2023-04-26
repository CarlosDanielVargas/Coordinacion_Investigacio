class ProjectInvestigator < ApplicationRecord
    belongs_to :project
    belongs_to :investigator

    enum role: [:principal, :co_investigator, :collaborator]

    def full_name
        self.investigator.first_name + " " + self.investigator.last_name
    end
end
