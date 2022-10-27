class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    # @tools = Tool.all
    @tools = policy_scope(Tool)
  end

  def new
    @tool = Tool.new
    authorize @tool
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    authorize @tool
    if @tool.save
      redirect_to tool_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @tool = Tool.find(params[:id])
    @tool.user = current_user
    authorize @tool
  end

  def edit
    authorize @tool
  end

  def update
    authorize @tool
  end

  def destroy
    authorize @tool
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :price)
  end
end
