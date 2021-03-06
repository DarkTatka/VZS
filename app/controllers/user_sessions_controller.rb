# -*- encoding : utf-8 -*-
class UserSessionsController < ApplicationController

  def new
	  @user_session = UserSession.new
  end

  def create
	  @user_session = UserSession.new(params[:user_session])
	  if @user_session.save
		  redirect_to root_url, :notice => 'Přihlášení úspěšné'
	  else
		  render :action => 'new'
	  end
  end
  
  def destroy
	  @user_session = UserSession.find
	  @user_session.destroy unless @user_session.nil?
	  redirect_to root_url, :notice => 'Odhlášení úspěšné'
  end

end
