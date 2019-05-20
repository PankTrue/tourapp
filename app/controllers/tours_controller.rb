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

    respond_to do |format|
      if @tour.save
        tours_clients_params.values.each { |value| value.values.each {|v| Clients_Tour.create(client_id: v[:id], tour_id: @tour.id)} }

        format.html { redirect_to @tour, notice: 'Tour was successfully created.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end

    # respond_modal_with @tour
  end

  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_tour
      @tour = Tour.find(params[:id])
    end

    def tour_params
      params.require(:tour).permit(:customer_id, :tour_operator, :appeal, :advertising_source,
                                   :currency, :passport_type, :office_city, :agency_represented,
                                   :manager, :number_person, :tour_country, :tour_city, :date_start,
                                   :date_end, :hotel_name, :hotel_start, :hotel_end, :room_category,
                                   :type_room, :type_food, :route_there, :route_back, :flight_number,
                                   :fly_type, :type_of_transport_there, :type_of_transport_back,
                                   :flight_type_there, :flight_type_back, :flight_back_class,
                                   :number_flight_back, :transfer_route, :transfer_type,
                                   :excursion_program, :additional_service, :cost_tour, :prepaid,
                                   :voluntary_insurance, :prihodnik_date, :prihodnik_prepaid
                                   # clients_attributes: [:id]
      )
    end

  def tours_clients_params
    params.require(:tour).permit(clients_attributes: [:id])
  end

end
