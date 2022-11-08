class Users::SellersdashController < ApplicationController
  before_action :authenticate_user!


  def sellerdash
    @user = current_user
    if current_user.buyer?
     #@user.role = 0
      @user.update(role: 1)
  end
end


 

  
end
