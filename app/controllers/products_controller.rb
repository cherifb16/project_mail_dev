class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  skip_before_action :onlySingnIn, only: [:index, :show]
  
  #before_action :thumbempty
  # GET /products or /products.json
  def index
   
    @products = Product.all.where(id: @all)
  end

  # GET /products/1 or /products/1.json
  def show
    session[:product_id] = @product.id 
    session[:user_id] = @product.user_id 
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
   
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    #Archive.create(false,@product.id)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Le produit a été créé avec succès." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    if current_user.products.ids.include?(params[:id].to_i) 
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to product_url(@product), notice: "Le produit a été mis à jour avec succès." }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to products_path, alert: "Permission refusée."
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: "Le produit a été détruit avec succès." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:price, :description, images: [])
    end

    
    def thumbempty
      #@products = Product.all
      #@products.each do |product|
      #  @product = Product.where(product.images.attached? == false) 
      #  @product.destroy
      #end
    end

end
