require 'httparty'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  include HTTParty
  headers 'User-Agent' => 'RecordStackBacklogs/0.1'
  base_uri 'http://musicbrainz.org/ws/2/'
  format :json

  def search
    response = get('/release-group/', :query => {:album => album})
    data = JSON.parse(response.body)
    @release = data['query']['results']
  end

  #def index
    #choose the URL to visit
   # @app_url = params[:url] || "http://musicbrainz.org/ws/2/"
    #ensure it starts with http
    #@app_url = "http://#{@app_url}" unless @app_url.starts_with?("http")

    #begin
      #retrieve the search
    #end
  # end

  def devise_parameter_sanitizer
  	if resource_class == User
  		User::ParameterSanitizer.new(User, :user, params)
  	else
  		super
  	end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
end
