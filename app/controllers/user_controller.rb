class UserController < ApplicationController
  def identify
    case params[:user].to_i
      when 0 then @user = User.find_by(first_name: params[:user].capitalize)
      when !0 then @user = User.find(params[:user])
    end
  end

  def get_id
    @user = User.find(params[:id])
  end
end
