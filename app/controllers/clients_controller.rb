class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    respond_to do |format|
      format.html
      format.json { render json: ClientDatatable.new(params, view_context: view_context) }
    end
  end

  def show
    @tours = @client.tours
    @manager = User.select(:name, :surname, :pantronymic).find(@client.user_id)
    respond_modal_with @client
  end

  def new
    @client = Client.new
    respond_modal_with @client
  end

  def edit
    respond_modal_with @client
  end


  def create
    @client = Client.new(client_params)
    @client.user_id = current_user.id
    @client.save!
    respond_modal_with @client, location: clients_path
  end


  def update
    @client.update!(client_params)
    respond_modal_with @client, location: clients_path
  end


  def destroy
    @client.destroy!
    respond_modal_with @client, location: clients_path
  end

  def autocomplite
    if(params[:q]).blank?
      @clients = Client.all.limit(25)
    else
      @clients = Client.where('lower(name) LIKE ?', "%#{params[:q].downcase}%")
              .or(Client.where('lower(surname) LIKE ?', "%#{params[:q].downcase}%"))
              .order('name asc').limit(25)
    end

    respond_to do |format|
      format.html { render json: @clients }
      format.json { render json: @clients }
    end
  end

private

    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit( :name, :surname, :pantronymic, :gender,
                                      :datebirth, :phone, :additional_phone, :email,
                                      :user_id )
    end

end
