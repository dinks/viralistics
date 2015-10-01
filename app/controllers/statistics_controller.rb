class StatisticsController < ApplicationController
  before_action :preset_statistic, only: [:show, :destroy]

  def index
    @statistics = Statistic.all
  end

  def show
  end

  def new
    @statistic = Statistic.new
  end

  def edit
  end

  def create
    @statistic = Statistic.new statistic_params

    respond_to do |format|
      if @statistic.save
        format.html { redirect_to @statistic, notice: "Test was successfully created." }
        format.json { render action: "show", status: :created, location: @statistic }
      else
        format.html { render action: "new" }
        format.json { render json: @statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
    @statistic.destroy

    respond_to do |format|
      format.html { redirect_to statistics_path }
      format.json  { head :ok }
    end
  end

  private

  def preset_statistic
    @statistic = Statistic.find params[:id]
  end

  def statistic_params
    params.require(:statistic).permit(:name, :url, :facebook, :google, :twitter, :reddit, :linkedin, :pinterest, :stumbleupon)
  end
end
