class V1::ProductsController < ApplicationController
  before_action :find_product, only: [:update, :show, :destroy]
  def index
    products = Product.all
    render json: products
  end

  def create
    product = Product.new(
      name: prod_params[:name],
      description: prod_params[:description]
    )

    if product.save
      render json: product, status: 200
    else
      render json: {error: "Error Add Product"}
    end
  end

  def show
    if @product
      render json: @product, status: 200
    else
      render json:  {error: "There's no product with that ID"}, status: 404
    end
  end

  def update
    if @product.update!(prod_params)
      render json: {"message": "data has been updated", "product": @product}, status: 200
    else
      render json:  {error: "There's no product with that ID"}, status: 404
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
  def prod_params
    params.require(:product)
          .permit([
            :name,
            :description
          ])
  end

  def find_product
    @product = Product.find_by(id: params[:id])
  end
end