class FacilitiesController < ApplicationController

  def index
    @facilities = Facility.all.paginate(page: params[:page])
  end

  def show
    @facility = Facility.find(params[:id])
    check_existence(@facility, facilities_path, "Facility not found")
    @facility_description_url = "app/views/facilities/_#{replace_char(@facility.name.downcase, " ", "_")}.html.erb"
  end

end
