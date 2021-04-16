class ItemsController < ApplicationController
  before_action :authorize
  before_action :require_admin
  before_action :set_item, only: %i[show update destroy]

  def index
    @items = Item.all.order_by_title
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
      render json: @item, status: 200
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

  def require_admin
    return if @current_user.admin

    render json: { error: 'Sorry, only admin user can see this page' }, status: 404
  end
end
