class UsersController < ApplicationController
    before_action :require_login, except: [:index, :create]
    before_action :require_correct_user, only: [:edit, :update, :destroy]

    def index
    end

    def create
        if params[:user][:password] == params[:user][:password_confirmation]
            @user = User.new( user_params )
            if !@user.valid?
                initialize_flash
                flash[:errors] = @user.errors.full_messages
                redirect_to "/main"
            else
                @user.save
                session[:user_id] = @user.id
                redirect_to "/bright_ideas"
            end
        else
            initialize_flash
            flash[:errors] << "Password does not match Password Confirmation"
            redirect_to "/main"
        end
    end


    def show
        @user = User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:name, :alias, :email, :password)
    end

  end
