class ClientDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to, :tour, :edit_tour_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||=
        {
            id:         { source: "Client.id", cond: :eq },
            FIO:        { source: "Client.name" , cond: :like},
            phone:      { source: "Client.phone" },
            email:      { source: "Client.email" },
            created_at: { source: "Client.created_at" },
        }
  end

  def data
    records.map do |record|
      {
          id: link_to(record.id, "/clients/#{record.id}", :class => 'btn btn-sm btn-default', data: { modal: true }),
          FIO: record.name + ' ' + record.surname,
          phone: record.phone,
          email: record.email,
          created_at: record.created_at,
          edit: link_to('Edit', "/clients/#{record.id}/edit", :class => 'btn btn-sm btn-default', data: { modal: true }),
          delete: link_to('Delete', "/clients/#{record.id}", method: :delete, :class => 'btn btn-sm btn-danger', data: { modal: true })
      }
    end
  end

  def get_raw_records
    Client.all
  end

end
