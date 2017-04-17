class RestaurantItemsController < ApplicationController
  before_action :set_restaurant_item, only: [:show, :edit, :update, :destroy]

  # GET /restaurant_items
  # GET /restaurant_items.json
  def index
    @restaurant_items = RestaurantItem.all
  end

  # GET /restaurant_items/1
  # GET /restaurant_items/1.json
  def show
  end

  # GET /restaurant_items/new
  def new
    @restaurant_item = RestaurantItem.new
    @menus = Menu.all
  end

  # GET /restaurant_items/1/edit
  def edit
    @menus = Menu.all 
  end

  # POST /restaurant_items
  # POST /restaurant_items.json
  def create
    @restaurant_item = RestaurantItem.new(restaurant_item_params)

    respond_to do |format|
      if @restaurant_item.save
        format.html { redirect_to @restaurant_item, notice: 'Restaurant item was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant_item }
      else
        format.html { render :new }
        format.json { render json: @restaurant_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_items/1
  # PATCH/PUT /restaurant_items/1.json
  def update
    respond_to do |format|
      if @restaurant_item.update(restaurant_item_params)
        format.html { redirect_to @restaurant_item, notice: 'Restaurant item was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant_item }
      else
        format.html { render :edit }
        format.json { render json: @restaurant_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_items/1
  # DELETE /restaurant_items/1.json
  def destroy
    @restaurant_item.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_items_url, notice: 'Restaurant item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_item
      @restaurant_item = RestaurantItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_item_params
      params.require(:restaurant_item).permit(:name, :price, :quantity, :description, :rating, :calories, :image, :menu_id)
    end
end
