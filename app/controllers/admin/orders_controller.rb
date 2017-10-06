class Admin::OrdersController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!, :admin_required

  def index
    @orders = Order.order('id DESC')
  end
end
