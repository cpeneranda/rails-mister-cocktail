class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

    def index
      @cocktails = Cocktail.all
    end

    def new
      @cocktail = Cocktail.new
    end

    def create
      @cocktail = Cocktail.new(cocktail_params)
      @cocktail.save
      redirect_to @cocktail
    end

    def edit
      # @cocktail = Cocktail.find(params[:id])
      # @cocktail.save
    end

    def update
      # @cocktail = Cocktail.find(params[:id])
      @cocktail.update(cocktail_params)
      if @cocktail.save
        redirect_to cocktails_path
      else
        render :edit
      end
    end

    def show
      @dose = Dose.new
    end

    def destroy
      @cocktail.destroy
      redirect_to cocktails_path
    end

    private

    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    def cocktail_params
      params.require(:cocktail).permit(:name)
    end


#     def new
#       @cocktail = Cocktail.new
#     end

#     # GET /restaurants/1/edit
#     def edit
#     end

#     # POST /restaurants
#     # POST /restaurants.json
#     def create
#       @cocktail = Cocktail.new(cocktail_params)

#       respond_to do |format|
#         if @restaurant.save
#           format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
#           format.json { render :show, status: :created, location: @restaurant }
#         else
#           format.html { render :new }
#           format.json { render json: @restaurant.errors, status: :unprocessable_entity }
#         end
#       end
#     end

#     # PATCH/PUT /restaurants/1
#     # PATCH/PUT /restaurants/1.json
#     def update
#       respond_to do |format|
#         if @restaurant.update(restaurant_params)
#           format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
#           format.json { render :show, status: :ok, location: @restaurant }
#         else
#           format.html { render :edit }
#           format.json { render json: @restaurant.errors, status: :unprocessable_entity }
#         end
#       end
#     end

#     # DELETE /restaurants/1
#     # DELETE /restaurants/1.json
#     def destroy
#       @restaurant.destroy
#       respond_to do |format|
#         format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
#         format.json { head :no_content }
#       end
#     end

#     private
#       # Use callbacks to share common setup or constraints between actions.
#       def set_restaurant
#         @restaurant = Restaurant.find(params[:id])
#       end

#       # Never trust parameters from the scary internet, only allow the white list through.
#       def restaurant_params
#         params.require(:restaurant).permit(:name, :address, :description, :stars)
#       end
#   end



end
