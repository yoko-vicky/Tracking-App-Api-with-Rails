class ItemsController < ApplicationController
  before_action :set_item, only: %i[show update destroy]

  def index
    @items = Item.all
    render json: @items, status: 200
  end

  def show
    if @item
      render json: @item, status: 200
    else
      render json: { error: 'Item was not found' }, status: 404
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item, status: 200
    else
      render json: { error: 'Item could not be created.' }, status: 404
    end
  end

  def update
    # byebug
    if @item.update(item_params)
      render json: @item, status: 200
    else
      render json: { error: 'Item could not be updated.' }, status: 404
    end
  end

  def destroy
    if @item
      @item.destory
      render json: { message: 'Successfully deleted', deleted_item: @item }, status: 200
    else
      render json: { error: 'Item could not be deleted' }, status: 404
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :unit, :icon)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
