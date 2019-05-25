class HomeController < ApplicationController
  def index
    @data = []
    100.times do |i|
      @data << {x: Date.current.to_time.utc, y: rand(100)}
    end

    # @tours = Tour.period_count_array

    # @tours.each do |date, count|
    #   @data << {x: date, y: count}
    # end
  end



  def chart

  end

private



end
