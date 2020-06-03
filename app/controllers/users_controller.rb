class UsersController < ApplicationController

    before_action :signed_in_user, only: [:index,:edit, :update, :destroy, :following, :followers]
    before_action :correct_user, only: [:edit, :update]
    before_action :admin_user,only: :destroy
    before_action :find_user, only: [:edit, :show, :destroy, :following, :followers, :update, :correct_user]
    skip_before_action :signed_in_user


  def following
    @title = "Following"
     @users = @user.followed_users.order(:name).page(params[:page]).per(params[:per_page] || 3)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
     @users = @user.followers.order(:name).page params[:page]
    render 'show_follow'
  end

  def new
    flash[:success]="1111111111"
  	@user=User.new
  end

  def show
    @microposts = @user.microposts.order(:name).page params[:page]
  end
  	
  def create
  	@user=User.new(user_params)
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to @user
  	else
  		render 'new'		
  	end
  end

  def edit
    
  end

  def index
   @users = User.order(:name).page(params[:page]).per(params[:per_page] || 5)
  end

def update
  if @user.update_attributes(user_params)
      flash[:success]="Profile updated"
      sign_in @user
      redirect_to @user
  else
    render 'edit'
    
  end
  
end
  
def destroy
  @user.destroy
  flash[:success] = "User destroyed."
  redirect_to users_path
  
end
  


  private
  def user_params
  	params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def find_user
    	@user = User.find(params[:id])
  end

  def correct_user
    redirect_to(root_path) unless current_user?(@user)
      
    end

    def admin_user
      redirect_to(root_path) unless current_user&.admin?
    end

end
    
  




