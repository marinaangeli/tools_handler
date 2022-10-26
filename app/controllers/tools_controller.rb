class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @tools = Tool.all
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to tool_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :price, :delivery)
  end
end
