class PlaysController < ApplicationController

  before_action :find_play, only: [:edit, :update, :destroy, :show]

  def index
    @plays = Play.all.order('created_at DESC')
  end

  def show
  end

  def new
    @play = Play.new
  end

  def create
    @play = Play.new(play_params)
    if @play.save
      flash[:success] = "Play successfully created"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

private

  def play_params
    params.require(:play).permit(:title, :description, :director)
  end

  def find_play
    @play = Play.find(params[:id])
  end
end
