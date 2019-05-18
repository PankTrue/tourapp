class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit

  protect_from_forgery with: :exception

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end

end
