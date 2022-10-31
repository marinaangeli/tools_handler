class RentalsController < ApplicationController

  def new
    @tool = Tool.find(params[:tool_id])
    @rental = Rental.new
    authorize @rental
  end

  def create
    @tool = Tool.find(params[:tool_id])
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.tool = @tool
    authorize @rental
    if @rental.save
      redirect_to tool_path(@tool)
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
end
