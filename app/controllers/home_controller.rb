class HomeController < ApplicationController

  protect_from_forgery :except => [:chart0, :chart1]


  def index
    @data = []
    100.times do |i|
      @data << {x: Date.current, y: rand(100)}
    end
  end



  def chart0
    data = []

    Tour.period_count_array(params[:date_start].blank? ? (Date.today-1.month).beginning_of_day : params[:date_start],
                            params[:date_end].blank? ? Date.today.end_of_day : params[:date_end],
                            { user_id: params[:manager] }, 'date(created_at)' ).each do |date, count|
      data << {x: date, y: count}
    end

    render json: data
  end

  def chart1
    data = []

    Tour.pluck(:tour_country).uniq.reject { |c| c.empty? }.each do |country|
      Tour.period_count_array(params[:date_start].blank? ? (Date.today-1.month).beginning_of_day : params[:date_start],
                              params[:date_end].blank? ? Date.today.end_of_day : params[:date_end],
                              { tour_country: country }, 'tour_country').each do |c, count|
        data << {label: c, y: count}
      end
    end

    puts data
    render json: data
  end



private



end
