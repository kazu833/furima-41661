class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_sold, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @record_information = RecordInformation.new
  end

  def create
    @record_information = RecordInformation.new(record_params)
    if @record_information.valid?
      pay_item
      @record_information.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def record_params
    params.require(:record_information).permit(:postal_code, :prefecture_id, :city, :street, :building,
                                               :phone_number).merge(token: params[:token], user_id = current_user.id, item_id = params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: record_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_if_sold
    if @item.record.present? || @item.user == current_user
      redirect_to root_path
    end
  end
end
