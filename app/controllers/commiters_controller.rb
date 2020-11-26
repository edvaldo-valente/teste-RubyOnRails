class CommitersController < ApplicationController
  before_action :set_commietrs

  def index
    if @commits
      render json: @commits, status: :ok
    else
      render json: {errors: @enemy.errors}, status: :not_found
    end
  end
  
  private
  
  def set_commietrs
    commiters = Commiters.new
    @commits = commiters.user
  end
end
