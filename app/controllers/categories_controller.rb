class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[create new index]
  before_action :authorize_user, only: %i[create new index]

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = t('.success')
      redirect_to category_path(@category.id)
    else
      @category = Category.new
      flash.now[:alert] = t('.error')
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def authorize_user
    return redirect_to root_path unless current_user.admin?
  end
end
