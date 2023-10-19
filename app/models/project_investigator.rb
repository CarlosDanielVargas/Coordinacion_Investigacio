class ProjectInvestigator < ApplicationRecord
    belongs_to :project
    belongs_to :individual

    enum role: [:principal, :co_investigator, :collaborator]

    def full_name
        self.individual.first_name + " " + self.individual.last_name
    end
end
