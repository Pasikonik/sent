class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @item.status = 'wait'
    respond_to do |format|
      if @item.save
        format.js { }
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.js { }
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :source, :destination_id)
  end
end
