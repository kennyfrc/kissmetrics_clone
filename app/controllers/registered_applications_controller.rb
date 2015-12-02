class RegisteredApplicationsController < ApplicationController
 def index
    @registered_applications = RegisteredApplication.all
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def create
    @registered_application = RegisteredApplication.new(application_params)
    if @registered_application.save
      flash[:notice] = "Application has been registered"
      redirect_to @registered_application
    else
      flash[:error] = "Registration failed. Please use a valid url with http://."
      render :new
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" has been deleted"
      redirect_to @registered_application
    else
      flash[:error] = "Failed to delete \"#{@registered_application.name}\". Please try again."
      redirect_to @registered_application
    end
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.update_attributes(application_params)
      flash[:notice] = "\"#{@registered_application.name}\" has been updated."
      redirect_to @registered_application
    else
      flash[:error] = "Failed to update \"#{@registered_application.name}\". Did you use a valid url?"
      render :edit
    end
  end

  private

  def application_params
    params.require(:registered_application).permit(:name, :url)
  end
end
