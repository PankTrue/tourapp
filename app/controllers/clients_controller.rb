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
    @client = Client.create(client_params)
    respond_modal_with @client, location: clients_path
  end


  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:name, :surname, :pantronymic, :gender, :datebirth, :phone, :additional_phone, :email)
    end

end
