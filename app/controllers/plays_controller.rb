class PlaysController < ApplicationController

  def index
    @play = Play.all
  end

end
