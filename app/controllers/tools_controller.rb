class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    # @tools = Tool.all
    @tools = policy_scope(Tool)
  end

  def my_tools
    @tools = Tool.where(user: current_user)
    authorize @tools
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

      redirect_to my_tools_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    set_tool
    authorize @tool
  end


  def edit
    set_tool
    authorize @tool
  end

  def update
    set_tool
    authorize @tool
    @tool.update(tool_params)
    redirect_to tool_path(@tool)
  end

  def destroy
    set_tool
    authorize @tool
    @tool.destroy
    # No need for app/views/tools/destroy.html.erb
    redirect_to my_tools_path, status: :see_other
  end

  private

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :price, :user, :photo, :address, :latitude, :longitude)
  end
end
