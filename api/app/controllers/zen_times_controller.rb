class ZenTimesController < ApplicationController
  before_action :authenticate_user
  before_action :set_zen_time, only: [:show, :update, :destroy]

  # GET /zen_times
  def index
    @zen_times = policy_scope(ZenTime)

    render json: @zen_times
  end

  # GET /zen_times/1
  def show
    authorize @zen_time
    render json: @zen_time
  end

  # POST /zen_times
  def create
    @zen_time = current_user.zen_times.new(zen_time_params)
    authorize @zen_time

    if @zen_time.save
      render json: @zen_time, status: :created, location: @zen_time
    else
      render json: @zen_time.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /zen_times/1
  def update
    authorize @zen_time
    if @zen_time.update(zen_time_params)
      render json: @zen_time
    else
      render json: @zen_time.errors, status: :unprocessable_entity
    end
  end

  # DELETE /zen_times/1
  def destroy
    authorize @zen_time
    @zen_time.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zen_time
      @zen_time = ZenTime.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def zen_time_params
      params.require(:zen_time).permit(:date, :time)
    end
end
