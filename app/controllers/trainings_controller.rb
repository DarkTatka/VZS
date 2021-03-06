# -*- encoding : utf-8 -*-
class TrainingsController < ApplicationController

  def index
    @trainings = Training.order('date ASC').where(['`date` > ?', Date.today - 2])
    authorize!(:index, Training)
  end

  def all
    @trainings = Training.order('date ASC')
    authorize!(:index, Training)
    render :action => "index"
  end

  def show
    @training = Training.find_by_id params[:id]
  end

  def new
    @training = Training.new :date => Time.now
  end

  def create
    @training = Training.new params[:training]
    if @training.save
      redirect_to :action => 'index', :notice => flash_message(:create, @training)
    else
      render :action => :new
    end
  end

  def edit
    @training = Training.find_by_id params[:id]
  end

  def train
    @training = Training.find params[:id]
    @training.profiles << current_user.profile unless @training.profiles.include?(current_user.profile)
  end

  def make_up_your_mind
    @training = Training.find params[:id]
    @training.profiles.delete current_user.profile
  end

  def update
    @training = Training.find params[:id]
    if @training.save
      redirect_to :action => 'index', :notice => flash_message(:update, @training)
    else
      render :action => 'edit', :notice => flash_message(:error, @training)
    end
  end

  def destroy
    @training = Training.find params[:id]
    @training.destroy
    redirect_to trainings_url, :notice => flash_message(:destroy, @gallery)
  end
end
