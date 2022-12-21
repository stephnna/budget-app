class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create 
    @category = Category.create(category_params)
    @category.user_id = current_user.id 

    if @category.save
      redirect_to categories_path, notice: 'Category created successfully!'
    else
      redirect_to new_category_path, notice: 'Oops!, Category could not be created!'
    end
  end

  private  

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end