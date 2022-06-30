class ApplicantsController < ApplicationController
  skip_before_action :authenticate_company!, only: :create
  before_action :set_applicant, only: %i[ show edit update destroy ]

  # GET /applicants or /applicants.json
  def index
    @vacancy = Vacancy.find(params[:vacancy_id])
    @applicants = Applicant.joins(:vacancy).where(
      vacancy_id: params[:vacancy_id],
      vacancy: { company_id: current_company.id },
    ).page(params[:page]).per(5)
  end

  # GET /applicants/1 or /applicants/1.json
  def show
  end

  # GET /applicants/new
  def new
    @applicant = Applicant.new
  end

  # GET /applicants/1/edit
  def edit
  end

  # POST /applicants or /applicants.json
  def create
    @applicant = Applicant.new(applicant_params)

    respond_to do |format|
      if @applicant.save
        format.html { redirect_to "/vacancies/all", notice: "Você se candidatou a vaga!" }
        format.json { render :show, status: :created, location: @applicant }
      else
        @vacancy = Vacancy.find(@applicant.vacancy_id)
        format.html { render "vacancies/show", status: :unprocessable_entity }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applicants/1 or /applicants/1.json
  def update
    respond_to do |format|
      if @applicant.update(applicant_params)
        format.html { redirect_to applicant_url(@applicant), notice: "Applicant was successfully updated." }
        format.json { render :show, status: :ok, location: @applicant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicants/1 or /applicants/1.json
  def destroy
    @applicant.destroy

    respond_to do |format|
      format.html { redirect_to applicants_url, notice: "Applicant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def applicant_params
    params.require(:applicant).permit(:name, :vacancy_id, :email, :curriculum)
  end
end
