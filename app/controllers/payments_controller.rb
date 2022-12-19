class PaymentsController < ApplicationController
  load_and_authorize_resource
  def index       
  end

  def new   
  end

  def create   
    end
  end

  private  

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end