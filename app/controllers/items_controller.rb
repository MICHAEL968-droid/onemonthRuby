class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def new
    @item = current_user.items.new
  end

  # GET /items/1/edit
  def edit
    @item = current_user.items.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to @item, notice: 'Item was successfully created.' 
    else
      render :new 
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    @item = current_user.items.find(params[:id])
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.' 
    else
      render :edit 
    
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.' 
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
   
    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :url, :description, :text)
    end
end
