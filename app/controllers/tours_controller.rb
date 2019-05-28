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
    @manager = User.select(:name, :surname, :pantronymic).find(@tour.user_id)
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

    is_ok = true
    ActiveRecord::Base.transaction do
      begin
        @tour.save!
        tours_clients_params.values.each do |value|
          raise ActiveRecord::Rollback unless Tour::is_clients_uniq value.values
          value.values.each do |v|
            Clients_Tour.create(client_id: v[:id], tour_id: @tour.id)
          end
        end
      rescue
        is_ok = false
        raise ActiveRecord::Rollback
      ensure
        is_ok ? (redirect_to tours_path, success: 'Запись была успешно создана.')
              : (redirect_to tours_path, danger: 'Не удалось создать запись.')
      end
    end
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
      params.require(:tour).permit(:customer_id, :user_id, :tour_operator, :appeal, :advertising_source,
                                   :currency, :passport_type, :office_city, :agency_represented,
                                   :number_person, :tour_country, :tour_city, :date_start,
                                   :date_end, :hotel_name, :hotel_start, :hotel_end, :room_category,
                                   :type_room, :type_food, :route_there, :route_back, :flight_number,
                                   :fly_type, :type_of_transport_there, :type_of_transport_back,
                                   :flight_type_there, :flight_type_back, :flight_back_class,
                                   :number_flight_back, :transfer_route, :transfer_type,
                                   :excursion_program, :additional_service, :cost_tour, :prepaid,
                                   :voluntary_insurance, :prihodnik_date, :prihodnik_prepaid
      )
    end

  def tours_clients_params
    params.require(:tour).permit(clients_attributes: [:id])
  end

end
