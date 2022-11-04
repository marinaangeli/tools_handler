class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_tool, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @tools = policy_scope(Tool).search_by_name_and_address(params[:query])
    else
      @tools = policy_scope(Tool)
    end
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
    @tool.address = current_user.address
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
    if @tool.update(tool_params)
      redirect_to tool_path(@tool)
    else
      render :edit
    end
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
    params.require(:tool).permit(:name, :price, :user, :address, :available, photos: [])
  end
end
