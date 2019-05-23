class HomeController < ApplicationController
  def index
    @tours = Tour.pluck(:created_at, :appeal)
  end
end
