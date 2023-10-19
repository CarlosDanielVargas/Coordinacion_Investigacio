class RequestsController < ApplicationController
  before_action :set_individuals, only: [:new, :create]

  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
  end

  def create
    byebug
    @request = Request.new(request_params)
    respond_to do |format|
      if @request.save
        format.html { redirect_to request_url(@request), notice: "Request was successfully created." }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def request_params
    params.require(:request).permit(:title, :date, :description, :individual_id)
  end

  def set_individuals
    @individuals = Individual.where(individual_type: 'Solicitante')
  end
end
