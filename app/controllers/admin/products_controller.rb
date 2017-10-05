class Admin::ProductsController < ApplicationController
  layout 'admin'

  before_action :load_product, only: [:edit, :update]
  before_action :authenticate_user!, :admin_required

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)
  end

  def load_product
    @product = Product.find(params[:id])
  end
end
