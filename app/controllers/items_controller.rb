class ItemsController < ApplicationController
  before_action :authorized, except: %i[index show]
  before_action :set_item, only: %i[show update destroy]

  def index
    @items = Item.order_by_title
    render json: @items, status: 200
  end

  def show
    if @item
      render json: @item, status: 200
    else
      render json: { error: 'Sorry, the item was not found' }, status: 404
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item, status: 201
    else
      render json: { error: 'Item could not be created.' }, status: 404
    end
  end

  def update
    if @item.update(item_params)
      render json: @item, status: 200
    else
      render json: { error: 'Item could not be updated.' }, status: 404
    end
  end

  def destroy
    if @item
      @item.destroy
      render json: { message: 'Successfully deleted', deleted_item: @item }, status: 200
    else
      render json: { error: 'Item could not be deleted' }, status: 404
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :unit, :icon, :target)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
