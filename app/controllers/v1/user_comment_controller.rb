class V1::UserCommentController < ActionController::API
    def index
        @coms = UserComment.all
        render json: @coms, status: :ok
    end
    def create
        @resto = Hotel.find (params[:hotel])
        @user = User.find(params[:user])
        @coms = UserComment.new
        @coms.message = params[:message]
        @coms.user = @user
        @coms.hotel = @resto
        @coms.save

        render json: @coms, status: :created
    end
    private

    def coms_params
        params.permit(:hotel, :user, :message)
    end

end
