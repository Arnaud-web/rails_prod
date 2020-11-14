class SiteController < ApplicationController
  def index
    ContactMailer.contact(Hotel.first).deliver_now
  end

  def login
  end
end
