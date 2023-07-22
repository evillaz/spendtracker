class SpendsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_spend, only: %i[show edit update destroy]

  # GET /spends or /spends.json
  def index
    @user = current_user
    @category = Category.find(params[:category_id])
    @category_spends = CategorySpend.includes(:spend).joins(:spend).where(category_id: params[:category_id])
    @spends = @category_spends.order(created_at: :desc).map(&:spend)
    @total_spend = @category_spends.sum('spends.amount')
  end

  # GET /spends/new
  def new
    @user = current_user
    @category = Category.find(params[:category_id])
    @spend = Spend.new
    @categories = Category.all
  end

  # POST /spends or /spends.json
  def create
    @user = current_user
    @category = Category.find(params[:category_id])
    @categories = Category.all
    @spend = current_user.spends.new(spend_params.except(:category_ids))

    respond_to do |format|
      if params[:new_spend][:category_ids].reject(&:blank?).empty?
        @spend.errors.add(:base, "Please select at least one category")
        format.html { render :new, status: :unprocessable_entity }
      else
        if @spend.save
          create_category_spends
          format.html { redirect_to category_spends_url, notice: 'Spend was successfully created.' }
          format.json { render :show, status: :created, location: @spend }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @spend.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private

  def create_category_spends
    category_ids = params[:new_spend][:category_ids]
    category_ids.each do |category_id|
      if category_id.present?
        CategorySpend.create(category_id:, spend_id: @spend.id)
      end
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_spend
    @spend = Spend.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def spend_params
    params.require(:new_spend).permit(:name, :amount, :category_ids)
  end
end
