class SiteController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end
  def mail 
   @data = params
   puts @data
    ContactMailer.contact(@data).deliver_now
    @response = "send"
    render json:@response , status: :created
  end
  def login
  end
end
