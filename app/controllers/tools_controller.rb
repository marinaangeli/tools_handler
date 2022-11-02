class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_tool, only: %i[show edit update destroy]

  def index
    # @tools = Tool.all
    @tools = policy_scope(Tool)
    @markers = @tools.geocoded.map do |tool|
      {
        lat: tool.latitude,
        lng: tool.longitude,
        info_window: render_to_string(partial: "info_window", locals: { tool: tool })
      }
    end
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
    authorize @tool
  end

  def edit
    authorize @tool
  end

  def update
    authorize @tool
    @tool.update(tool_params)
    redirect_to tool_path(@tool)
  end

  def destroy
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
    params.require(:tool).permit(:name, :price, :user, :address, photos: [])
  end
end
