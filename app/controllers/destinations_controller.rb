class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy, :add_items]

  def index
    @destination = Destination.new
    @destinations = Destination.all
  end

  def show
  end

  def new
    @destination = Destination.new
  end

  def edit
    @pages = @destination.user.page_list
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.user = current_user
    respond_to do |format|
      if @destination.save
        format.html { redirect_to @destination, notice: 'Destination was successfully created.' }
        format.json { render :show, status: :created, location: @destination }
      else
        format.html { render :new }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @destination.update(destination_params)
        format.html { redirect_to @destination, notice: 'Destination was successfully updated.' }
        format.json { render :show, status: :ok, location: @destination }
      else
        format.html { render :edit }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @destination.destroy
    respond_to do |format|
      format.html { redirect_to destinations_url, notice: 'Destination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_destination
    @destination = Destination.find(params[:id])
  end

  def destination_params
    params.require(:destination).permit(:name, :user_id, :item_id, :fb_page)
  end
end
