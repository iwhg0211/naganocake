class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all
  end

  def about
  end
  
  private
  
  def item_params
    params.require(:item).permit(:item_image, :name, :price)
  end
  
end