class Admin::ProgrammesController < Admin::AdminApplicationController
  
  def new
    @programme = Programme.new
  end

  def create
    @programme = Programme.create!(programme_params)
    if @programme.save
      flash[:success] = "Programme successfully created"
      redirect_to admin_programmes_path
    else
      flash[:danger] = "An error occurred creating this programme"
      render 'admin/programmes/new'
    end
  end

  def edit
    @programme = Programme.find(params[:id])
    check_existence(@programme, admin_programmes_path, "Programme not found")
  end

  def update
    @programme = Programme.find(params[:id])
    check_existence(@programme, admin_programmes_path, "Programme not found")
    @programme.update(programme_params)
    if @programme.save
      flash[:success] = "Programme successfully updated"
      redirect_to admin_programmes_path
    else
      render 'admin/programmes/edit'
    end
  end

  def index
    @programmes = Programme.all.paginate(page: params[:page])
  end

  def destroy
    @programme = Programme.find(params[:id])
    check_existence(@programme, admin_programmes_path, "Programme not found")
    if @programme.destroy
      flash[:success] = "Programmme successfully removed"
      redirect_to admin_programmes_path
    else
      flash.now[:danger] = "An error occurred removing the selected programme"
      render 'admin/programmes/index'
    end
  end

  def show
    @programme = Programme.find(params[:id])
    check_existence(@programme, admin_programmes_path, "Programme not found")
    @programme_description_url = "app/views/programmes/_#{replace_char(@programme.name.downcase, " ", "_")}.html.erb"
  end

  private

    def programme_params
      params.require(:programme).permit(:name, :avatar, :remove_avatar)
    end
end
