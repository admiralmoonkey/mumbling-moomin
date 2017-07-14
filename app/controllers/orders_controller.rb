class OrdersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def Destroy
  end

  def new_order
    @user = user
    @product = product
    mail( :to => user.email, :subject => "Order confirmation").deliver_now
  end
end
