class HomeController < ApplicationController
  skip_before_action :onlySingnIn, only: [:index]
  def index
    @user = current_user
    @nbrAR = 0
    if current_user
      (0...@product.count).each do |i|  
        if current_user.product_ids.include?(@product[i]) == true 
            @nbrAR = @nbrAR + 1
        end 
        
      end 
    end
  end

  def private
    @user = current_user
  end
end
