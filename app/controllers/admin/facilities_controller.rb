class Admin::FacilitiesController < Admin::AdminApplicationController
  
  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.create!(facility_params)
    if @facility.save
      flash[:success] = "Facility successfully created"
      redirect_to admin_facilities_path
    else
      flash.now[:danger] = "An error occurred creating this facility"
      render 'admin/facilities/new'
    end
  end

  def edit
    @facility = Facility.find(params[:id])
  end

  def update
    @facility = Facility.find(params[:id])
    check_existence(@facility, admin_facilities_path, "Facility not found")
    @facility.update(facility_params)
    if @facility.save
      flash[:success] = "Facility successfully updated"
      redirect_to admin_facilities_path
    else
      flash.now[:danger] = "An error occurred creating this facility"
      render 'admin/facilities/edit'
    end
  end

  def destroy
    @facility = Facility.find(params[:id])
    check_existence(@facility, admin_facilities_path, "Facility not found")
    if @facility.destroy
      flash[:success] = "Facility successfully deleted"
      redirect_to admin_facilities_path
    else
      flash.now[:danger] = "An error occurred deleting this facility"
      render 'admin/facilities/index'
    end

  end

  def index
    @facilities = Facility.all.paginate(page: params[:page])
  end

  def show
    @facility = Facility.find(params[:id])
    check_existence(@facility, admin_facilities_path, "Facility not found")
    @facility_description_url = "app/views/facilities/_#{replace_char(@facility.name.downcase, " ", "_")}.html.erb"
  end

  private

    def facility_params
      params.require(:facility).permit(:name, :avatar, :remove_avatar)
    end

end
