class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to registration_completed_path 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def registration_complete
  end

end
