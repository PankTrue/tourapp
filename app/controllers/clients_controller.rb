class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @clients = Client.all
    @client  = Client.new
  end

  def show
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
    @client = Client.create!(client_params)
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
      params.require(:client).permit(:name, :surname, :pantronymic, :gender,
                                     :datebirth, :phone, :additional_phone, :email )
    end

end
