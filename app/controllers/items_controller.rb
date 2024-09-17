class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new]
  def index
  end

  def new
    
  end
  private
	def move_to_index
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
  end
