class ItemsController < ApplicationController
  def create
    item = Item.new(item_params)
    item.save
    redirect_to root_path
  end

  private def item_params
    params.require(:item).permit(:name, :calories)
  end
end
