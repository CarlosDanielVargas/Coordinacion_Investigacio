class MinutesController < ApplicationController
  before_action :set_minute, only: %i[ show edit update destroy ]
  before_action :set_projects, only: [:new, :edit, :create, :update, :destroy]

  # GET /minutes or /minutes.json
  def index
    @q = Minute.ransack(params[:q])
    @minutes = @q.result(distinct: true).includes(:projects, :individuals)

    if params[:q].nil?
      @minutes = Minute.all.paginate(page: params[:page], per_page: 7)
      return
    end

    q_project = params[:q][:project_id_eq]
    if q_project.present?
      @minutes = @minutes.where(projects: { id: q_project })
    end

    q_investigator = params[:q][:investigator_id_eq]
    if q_investigator.present?
      @minutes = @minutes.where(individuals: { id: q_investigator })
    end

    @minutes = @minutes.distinct.paginate(page: params[:page], per_page: 7)
  end

  def search
    index
    render :index
  end

  # GET /minutes/1 or /minutes/1.json
  def show
  end

  # GET /minutes/new
  def new
    @minute = Minute.new
  end

  # GET /minutes/1/edit
  def edit
  end

  # POST /minutes or /minutes.json
  def create
    @minute = Minute.new(minute_params)
    respond_to do |format|
      if @minute.save
        format.html { redirect_to minute_url(@minute), notice: 'Minute was successfully created.' }
        format.json { render :show, status: :created, location: @minute }
      else
        set_projects
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @minute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minutes/1 or /minutes/1.json
  def update
    respond_to do |format|
      if @minute.update(minute_params)
        format.html { redirect_to minute_url(@minute), notice: "Minute was successfully updated." }
        format.json { render :show, status: :ok, location: @minute }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @minute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minutes/1 or /minutes/1.json
  def destroy
    @minute.destroy

    respond_to do |format|
      format.html { redirect_to minutes_url, notice: "Minute was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_minute
    @minute = Minute.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def minute_params
    params.require(:minute).permit(:number, :date, :file,
                                   articles_attributes: [:id, :_destroy, :code, :minute_id, :project_id,
                                                         agreements_attributes: [:id, :_destroy, :code, :article_id, :description,
                                                                                 transaction_records_attributes: [:id, :_destroy, :description, :status, :agreement_id,
                                                                                                                  notices_attributes: [:id, :_destroy, :code, :transaction_record_id, :file]]]])
  end

  def set_projects
    @projects = Project.all
  end
end
