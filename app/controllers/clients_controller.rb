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
    if @client.save
      redirect_to @client, success: 'Клиент успешно создан'
    else
      render :new, danger: 'Не удалось создать запись.'
    end
  end

  def update
    if @client.update(client_params)
      redirect_to @client, success: 'Клиент успешно отредактирован'
    else
      render :edit, danger: 'Не удалось изменить запись.'
    end
  end

  def destroy
    if @client.destroy
      redirect_to clients_path, success: 'Запись успешно удалена.'
    else
      redirect_to clients_path, success: 'Nе удалось удалить запись.'
    end
  end

  def autocomplite
    if(params[:q]).blank?
      @clients = Client.all.limit(25)
    else
      @clients = Client.where('name LIKE ?', "%#{params[:q].upcase}%")
      .or(Client.where('lower(surname) LIKE ?', "%#{params[:q].upcase}%"))
      .or(Client.where('lower(pantronymic) LIKE ?', "%#{params[:q].upcase}%"))
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
