class ProgrammesController < ApplicationController

  def index
    @programmes = Programme.all.paginate(page: params[:page])
  end

  def show
    @programme = Programme.find(params[:id])
    check_existence(@programme, programmes_path, "Programme not found")
    @programme_description_url = "app/views/programmes/_#{replace_char(@programme.name.downcase, " ", "_")}.html.erb"
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

end
