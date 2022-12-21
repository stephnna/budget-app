class PaymentsController < ApplicationController
  load_and_authorize_resource  
  def index 
    @category = Category.find(params[:category_id])
    @payments = @category.recent_payments     
  end

  def new
    @category = Category.find(params[:category_id])
    @payment = @category.payments.new    
  end

  def create
    @category = Category.find(params[:category_id])
    @payment = @category.payments.create(name: payment_params[:name], amount: payment_params[:amount],
                                      user_id: current_user.id, category_id: @category.id)
   
      if @payment.save
         redirect_to category_payments_path(@category.id), notice: 'Transaction created successfully!' 
      else
         render :new
    end
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:name, :amount)
  end 
  
end