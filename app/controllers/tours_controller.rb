class ToursController < ApplicationController

  before_action :set_tour, only: [:show, :edit, :update, :destroy]


  respond_to :html, :json


  def index
    respond_to do |format|
      format.html
      format.json { render json: TourDatatable.new(params, view_context: view_context) }
    end
  end

  def show
    @manager = User.select(:fio).find(@tour.user_id)
    respond_modal_with @tour
  end

  def new
    @tour = Tour.new
  end

  def edit
    respond_modal_with @tour
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user_id = current_user.id

    if @tour.save
      redirect_to tours_path, success: 'Запись была успешно создана.'
    else
      redirect_to new_tour_path, danger: 'Не удалось создать запись.'
    end
  end

  def update
    if @tour.update(tour_params)
      redirect_to @tour, success: 'Запись была успешно изменена.'
    else
      render :edit, danger: 'Не удалось изменить запись.'
    end
  end

  def destroy
    if @tour.destroy
      redirect_to tours_url, success: 'Tour was successfully destroyed.'
    else
      redirect_to tours_url, danger: 'Tour dosnt destroy'
    end

  end

private

    def set_tour
      @tour = Tour.find(params[:id])
    end

    def tour_params
      params.require(:tour).permit(:customer_id, :user_id, :tour_operator, :appeal, :advertising_source,
                                   :currency, :passport_type, :office_city, :agency_represented,
                                   :number_person, :tour_country, :tour_city, :date_start,
                                   :date_end, :hotel_name, :hotel_start, :hotel_end, :room_category,
                                   :type_room, :type_food, :route_there, :route_back, :flight_number,
                                   :fly_type, :type_of_transport_there, :type_of_transport_back,
                                   :flight_type_there, :flight_type_back, :flight_back_class,
                                   :number_flight_back, :transfer_route, :transfer_type,
                                   :excursion_program, :additional_service, :cost_tour, :prepaid,
                                   :voluntary_insurance, :prihodnik_date, :prihodnik_prepaid,
                                   clients_attributes: [:id,:_destroy]
      )
    end
end
