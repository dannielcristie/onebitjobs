class VacanciesController < ApplicationController
  before_action :set_vacancy, only: %i[ show edit update destroy ]

  # GET /vacancies or /vacancies.json
  def index
    @vacancies = Vacancy.all
  end

  # GET /vacancies/1 or /vacancies/1.json
  def show
  end

  # GET /vacancies/new
  def new
    @vacancy = Vacancy.new
  end

  # GET /vacancies/1/edit
  def edit
  end

  # POST /vacancies or /vacancies.json
  def create
    @vacancy = Vacancy.new(vacancy_params)

    respond_to do |format|
      if @vacancy.save
        format.html { redirect_to vacancy_url(@vacancy), notice: "Vacancy was successfully created." }
        format.json { render :show, status: :created, location: @vacancy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vacancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacancies/1 or /vacancies/1.json
  def update
    respond_to do |format|
      if @vacancy.update(vacancy_params)
        format.html { redirect_to vacancy_url(@vacancy), notice: "Vacancy was successfully updated." }
        format.json { render :show, status: :ok, location: @vacancy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vacancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacancies/1 or /vacancies/1.json
  def destroy
    @vacancy.destroy

    respond_to do |format|
      format.html { redirect_to vacancies_url, notice: "Vacancy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacancy
      @vacancy = Vacancy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vacancy_params
      params.require(:vacancy).permit(:title, :location, :description, :requirements, :salary, :avaliable, :company_id)
    end
end
