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

      redirect_to tools_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    set_tool
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

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :price, :user, :photo)
  end
end
