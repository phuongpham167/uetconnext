class PagesController < ApplicationController
  
  def home
    render "shared/_login" if !user_signed_in?
  end
end
