class Users::BuyersdashController < ApplicationController
  before_action :authenticate_user!
  

  def buyerdash
    @user = current_user
    if current_user.seller?
     #@user.role = 0
      @user.update(role: 0)
  end
end



  
end
