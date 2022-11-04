class RentalsController < ApplicationController
  before_action :set_rented_tool, only: %i[new create]

  def new
    @rental = Rental.new
    authorize @rental
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.tool = @tool
    authorize @rental
    if @rental.save
      @tool.update(available: false)
      redirect_to my_rentals_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @rental
  end

  def my_rentals
    @rentals = Rental.where(user: current_user)
    authorize @rentals
  end

  private

  def rental_params
    params.require(:rental).permit(:days, :delivery)
  end

  def set_rented_tool
    @tool = Tool.find(params[:tool_id])
  end
end
