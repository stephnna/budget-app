class CategoriesController < ApplicationController
  def index
    @groups = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @group = Category.new
  end

  def create  
  end

  private  

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end