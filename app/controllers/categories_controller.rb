class CategoriesController < ApplicationController

  def show
    @category = Category.find_by_id(params[:id])
    render json: @category
  end

end
