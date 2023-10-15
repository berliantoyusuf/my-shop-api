class V1::ProductsController < ApplicationController
  before_action :find_product, only: [:update, :show, :destroy]
  def index
    products = Product.all
    render json: products
  end

  def create
    product = Product.new(product_params)

    if product.save
      render json: product, status: 200
    else
      render json: {error: "Error Add Product"}
    end
  end

  def show
    if @product.blank?
      render json:  {error: "There's no product with that ID"}, status: 404
    else
      @material_prices = @product.material_prices
    end
  end

  def update
    if @product.blank?
      render json:  {error: "There's no product with that ID"}, status: 404
    else
      @product.update!(product_params)
      @material_prices = @product.material_prices
      render :show
    end
  end

  def destroy
    if @product.present?
      if @product.destroy
        render json: {"message": "product has been deleted"}, status: 200
      else
        render json:  {error: "Cannot delete product"}, status: 404
      end
    else
      render json:  {error: "There's no product with that ID"}, status: 404
    end
  end


  private
  def product_params
    params.require(:product)
          .permit(:name,
                  :description,
                  material_prices_attributes: [:id, :name, :quantity, :currency, :price, :products_id]
          )
  end

  def find_product
    @product = Product.find_by(id: params[:id])
  end
end