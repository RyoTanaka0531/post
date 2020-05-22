class ItemsController < ApplicationController
  def index
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      @items = Item.order(created_at: :desc).limit(8)
      render :create
    else
      render :new
    end
  end

  def index
    @items = Item.order(created_at: :desc).limit(8)
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).perit(:title, :user_id)
  end
end
