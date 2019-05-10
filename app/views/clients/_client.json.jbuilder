json.extract! client, :id, :name, :surname, :pantronymic, :gender, :datebirth, :phone, :additional_phone, :email, :created_at, :updated_at
json.url client_url(client, format: :json)
