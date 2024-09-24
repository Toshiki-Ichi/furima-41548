class CustomersController < ApplicationController
  def index
		@item = Item.find(params[:item_id]) 
		@customer_area = CustomerArea.new
		gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end

	def create
		@item = Item.find(params[:item_id]) 
    @customer_area = CustomerArea.new(customer_params)
    @customer_area.price = @item.price
    if @customer_area.valid?
      pay_item
      @customer_area.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end

private
def customer_params
params.require(:customer_area).permit(:postal, :region_id, :city, :city_num, :building, :tel_num, :price).merge(user_id: current_user.id, token: params[:token])

end
def pay_item
	Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
	Payjp::Charge.create(
	amount: order_params[:price],
	card: order_params[:token],
	currency: 'jpy'
)
end

end