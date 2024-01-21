class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :set_investigators, only: %i[ new edit create update ]

  # GET /projects or /projects.json
  def index
    @q = Project.ransack(params[:q])
  
    if params[:q].nil?
      @projects = Project.all.paginate(page: params[:page], per_page: 5)
      return
    end
  
    q_investigator = params[:q][:project_investigators_id_eq]
    if q_investigator.present?
      investigator_projects = Project.joins(:project_investigators).where(project_investigators: { individual_id: q_investigator })
      @projects = investigator_projects
    else
      @projects = @q.result(distinct: true)
    end
  
    @projects = @projects.distinct.paginate(page: params[:page], per_page: 5)    
  end   

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    if @individuals.empty?
      flash[:notice] = "No se han agregado investigadores a la base de datos. Para agregar un proyecto, debe agregar al menos un investigador."
      redirect_to new_individual_path
    else
      @project = Project.new
    end
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    get_investigators_passed_in_params

    respond_to do |format|
      if @project.save
        add_investigators_to_project
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_url, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  def set_investigators
    @individuals = Individual.where(individual_type: 'Investigador')
    @selected_investigator_id = @project.principal_investigator.id unless @project.nil?
  end

  def add_investigators_to_project
    byebug
    @investigators_to_add.each { |investigator| 
      if investigator == @investigators_to_add.first then 
        @project_investigator = ProjectInvestigator.create(project_id: @project.id, individual_id: investigator.id, role: 0)
      else
         @project_investigator = ProjectInvestigator.create(project_id: @project.id, individual_id: investigator.id, role: 1)
      end }
  end

  def get_investigators_passed_in_params
    @investigators_to_add = Array.new

    if params[:project][:principal_investigator].nil? then return end
    # Investigador principal
    principal_investigator_id_card = params[:project][:principal_investigator].split(" (")[1].split(")")[0]
    principal_investigator = Individual.find_by(id_card: principal_investigator_id_card)
    @investigators_to_add << principal_investigator

    if params[:project][:individuals].nil? then return end
    # Investigadores asociados
    params[:project][:individuals].each { |investigator|
      if investigator[1] == "1" then @investigators_to_add << Individual.find(investigator[0]) end
    }
  end

  def project_params
    params.require(:project).permit(:preAcceptanceCode, :finalCode, :name)
  end
end
