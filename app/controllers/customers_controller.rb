class CustomersController < ApplicationController
  def index
		@customer_area = CustomerArea.new
    @item = Item.find(params[:item_id]) 
		gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end

	def create
		buinding.pry
    @customer = Customer.new(customer_params)
    if @cutomer.valid?
      pay_item
      @customer.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end

private
def customer_params
params.require(:customer_area).permit(:price).merge(token:params[:token])
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