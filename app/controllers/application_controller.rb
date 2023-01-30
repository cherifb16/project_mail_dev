class ApplicationController < ActionController::Base
    before_action :configure_devise_parameters, if: :devise_controller?
    before_action :onlySingnIn
    before_action :nbr
    
    
    add_flash_types :success, :danger
    skip_before_action :onlySingnIn, if: :devise_controller?
    def configure_devise_parameters
        devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:pseudo,:email, :password, :password_confirmation)}
    end

    
    private

    

    def onlySingnIn
        if !userSingnIn 
            redirect_to '/', alert: "s'il vous plait connecté vous"
        end 
        #session.destroy(:top)
    end

    def userSingnIn
        !current_user.nil?
    end

    def nbr
        @product = [] #indesirable
        @archive = Archive.all.where(archive: true)
        @archive.each do |archive| 
            @product << archive.product_id
        end
        @all = [] #yes listing product
    

        Product.all.each do |prod| 
          if @product.include?(prod.id) == false
              @all << prod.id
          end
        end
        
        @all2 = []# home product yes
        if current_user
            current_user.products.each do |prod| 
                if @product.include?(prod.id) == false
                    @all2 << prod.id
                end
            end
        end
    end

end
