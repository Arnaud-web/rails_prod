class V1::HotelsController < ActionController::API
    # skip_before_action :verify_authenticity_token
    def index
        @resto = Hotel.all
        render json: @resto, status: :ok
    end
    def create
        @resto = Hotel.new(contact_params)
        @user = User.find(params[:user])
        @resto.user = @user
        @resto.save

        render json: @resto, status: :created
    end

    def show
        @resto = Hotel.find (params[:id])
        render json: @resto, status: :ok
    end

    def update
        @resto = Hotel.find(params[:id])
        @resto.update(contact_params)
        # @resto.update(name: params[:name],specialty: params[:specialty],prix: params[:prix],adress: params[:adress],photo: params[:photo])
        render json: @resto, status: :ok

    end
    
    def destroy
        @resto = Hotel.where(id: params[:id]).first
        if @resto.destroy
            head(:ok)
        else
            head(:unprocessable_entity)
        end
    end
    

    private

    def contact_params
        params.permit(:name, :specialty, :prix,:adress,:photo)
    end
    
end
