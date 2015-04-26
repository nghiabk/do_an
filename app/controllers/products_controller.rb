class ProductsController < ApplicationController
  # attr_accessible :name, :price, :released_on

  def index
    @products = Product.all
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv }
      format.xls 
    end
  end

  def import
    Product.import params[:file] 
    redirect_to root_url, notice: "Products imported."
  end

  private 
  def product_params
     params.require(:product).permit :name, :price, :released_on
  end
end
