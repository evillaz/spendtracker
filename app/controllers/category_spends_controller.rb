class CategorySpendsController < ApplicationController
  before_action :set_category_spend, only: %i[show edit update destroy]

  # GET /category_spends or /category_spends.json
  def index
    @category_spends = CategorySpend.all
  end

  # GET /category_spends/1 or /category_spends/1.json
  def show; end

  # GET /category_spends/new
  def new
    @category_spend = CategorySpend.new
  end

  # GET /category_spends/1/edit
  def edit; end

  # POST /category_spends or /category_spends.json
  def create
    @category_spend = CategorySpend.new(category_spend_params)

    respond_to do |format|
      if @category_spend.save
        format.html do
          redirect_to category_spend_url(@category_spend), notice: 'Category spend was successfully created.'
        end
        format.json { render :show, status: :created, location: @category_spend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category_spend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_spends/1 or /category_spends/1.json
  def update
    respond_to do |format|
      if @category_spend.update(category_spend_params)
        format.html do
          redirect_to category_spend_url(@category_spend), notice: 'Category spend was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @category_spend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category_spend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_spends/1 or /category_spends/1.json
  def destroy
    @category_spend.destroy

    respond_to do |format|
      format.html { redirect_to category_spends_url, notice: 'Category spend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category_spend
    @category_spend = CategorySpend.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_spend_params
    params.fetch(:category_spend, {})
  end
end
