class HomeController < ApplicationController

  protect_from_forgery :except => [:chart_0]


  def index
    @data = []
    100.times do |i|
      @data << {x: Date.current, y: rand(100)}
    end

    # @tours = Tour.period_count_array

    # @tours.each do |date, count|
    #   @data << {x: date, y: count}
    # end
  end



  def chart_0

    data = []

    Tour.period_count_array(params[:date_start].blank? ? (Date.today-1.month).beginning_of_day : params[:date_start],
                            params[:date_end].blank? ? Date.today.end_of_day : params[:date_end]).each do |date, count|
      data << {x: date, y: count}
    end

    render json: data
  end



private



end
