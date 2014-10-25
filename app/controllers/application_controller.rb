class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :funky_headers
  before_filter :set_cookies!

  def set_cookies!
    if cookies[:ref].blank?
      random_hash = SecureRandom.hex(15)
      cookies[:ref] = { :value => random_hash, :expires => 6.months.from_now }
    end
  end

  def set_visitor!
    ip = request.env["REMOTE_ADDR"]
    @visitor = nil
    if cookies[:ref]
      @visitor   =  Visitor.find_by(ip: ip, cookie_id: cookies[:ref]) 
      @visitor ||=  Visitor.create(ip: ip, cookie_id: cookies[:ref])
    end
  end

  def funky_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

end
