class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_visitor!

  def set_visitor!
    ip = request.env["REMOTE_ADDR"]
    if cookies[:ref].blank?
      random_hash = SecureRandom.hex(15)
      cookies[:ref] = { :value => random_hash, :expires => 6.months.from_now }
      @visitor = Visitor.create(ip: ip, cookie_id: random_hash)
    else
      @visitor = Visitor.find_by(ip: ip, cookie_id: cookies[:ref])      
    end

  end

end
