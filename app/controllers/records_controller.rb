class RecordsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:index, :create]

  def index
    @record_information = RecordInformation.new
  end

  def create
    @record_information = RecordInformation.new(record_params)
    @record_information.user_id = current_user.id
    @record_information.item_id = params[:item_id]
    
    if @record_information.valid?
      @record_information.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def record_params
    params.require(:record_information).permit(:postal_code, :prefecture_id, :city, :street, :building, :phone_number)
  end

end
