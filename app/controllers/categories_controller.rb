class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:index]

  # GET /categories or /categories.json
  def index
    @user = current_user
    if @user.present?
      @categories = @user.categories
    end
    @category_totals = CategorySpend
    .joins(:category, :spend)
    .select('category_id, SUM(spends.amount) AS total_amount')
    .group('category_id')
  end

  # GET /categories/new
  def new
    @user = current_user
    @category = Category.new
    respond_to do |format|
      format.html { render :new, locals: { category: @recipe, user: @user } }
    end
  end

  # POST /categories or /categories.json
  def create
    @user = current_user
    @category = @user.categories.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:new_category).permit(:name, :icon)
  end
end
