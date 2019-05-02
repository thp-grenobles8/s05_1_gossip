class UsersController < ApplicationController
  def identify
    case params[:user].to_i
      when 0 then @user = User.find_by(first_name: params[:user].capitalize)
      when !0 then @user = User.find(params[:user])
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    city_exist?
    User.create!(
      first_name:            params[:first_name],
      last_name:             params[:last_name],
      description:           params[:description],
      email:                 params[:email],
      age:                   params[:age],
      city_id:               City.find_by(name: params[:city]).id,
      password:              params[:password],
      password_confirmation: params[:password_confirmation]
    )
    redirect_to :root
  end

  def city_exist?
    if City.find_by(name: params[:city]).nil?
      City.create!(
        name:     params[:city],
        zip_code: Faker::Address.zip_code
      )
      return true
    else
      City.find_by(name: params[:city]).id
      return true
    end
  end
end
