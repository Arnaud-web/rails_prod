class SiteController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end
  def mail 
   @data = params
   @h = @data['hotel']['user_id']
   @user = User.find_by(id: @h)
   @data[:userH] = @user
   #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
   puts @user.inspect
  #  @user = User.find(@data['hotel']['user_id'])
  #  @data['userHotel'] = @user
  #  puts @user.inspect
  
    ContactMailer.contact(@data).deliver_now
    @response = "send"
    render json:@response , status: :created
  end
  def login
  end
end
