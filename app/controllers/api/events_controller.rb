class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token #just for the purposes of this exercise. skipping this is dangerous
  before_action :set_access_control_headers # this is to allow POST requests across
                  # domains by setting CORS response headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*' # allow requests from any origin
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS' # permit these specific request methods
    headers['Access-Control-Allow-Headers'] = 'Content-Type' #used in HTTP requests to declatre the tyep of data being sent
  end



  def create
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])

    if registered_application.nil?
      render json: "Unregistered Application", status: :unprocessable_entity
    else
      @event = registered_application.events.new(event_params)
      if @event.save
        render json: @event, status: :created
      else
        render @event.errors, status: :unprocessable_entity
      end
    end
    
  end

  private

  def event_params
    params.permit(:name)
  end
end