class V1::UsersController < ActionController::API
  # skip_before_action :verify_authenticity_token
  
    # REGISTER
    def create
      @user = User.create(user_params)
      render json: @user
    end
  
    # LOGGING IN
    def login
      @user = User.find_by(email: params[:email])
  
      # if @user && @user.authenticate(params[:password])
      #   render json: @user
      if authenticate(@user.email,params[:password])
        render json: @user
      else
        render json: {error: "Invalid username or password"}
      end
    end
  
  
    def auto_login
      render json: @user
    end
  
    private
  
    def user_params
        params.permit(:email,:role, :password, :password_confirmation)
    end
    def authenticate(email, password)
      # @user = find_by_email(email)
      if @user && @user.encrypted_password == BCrypt::Engine.hash_secret(password, @user.encrypted_password)
        @user
      else
        nil
      end
    end
    
  
  
end
