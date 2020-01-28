class Admin::MembersController < Admin::AdminApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new
    @member = Member.create(admin_member_params)
    if @member.save
      @member.admin? ? flash[:success] = "New Admin Created Successfully" : flash[:success] = "New Member Created Successfully"
      redirect_to admin_member_path(@member)
    else
      render 'admin/new'
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(admin_member_params)
    if @member.save
      @member.admin? ? flash[:success] = "Admin Updated Successfully" : flash[:success] = "Member Updated Successfully"
      redirect_to admin_member_path(@member)
    else
      render 'admin/edit'
    end
  end

  def index
    @members = Member.all.paginate(page: params[:page])
  end

  def show
    @member = Member.find(params[:id])
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    @member.admin? ? flash[:success] = "Admin Removed Successfully" : flash[:success] = "Member Updated Successfully"
    redirect_to admin_members_path
  end

  private

    def admin_member_params
    params.require(:member).permit(:user_name, :first_name, :last_name, :email, :phone_no, :password, :password_confirmation, :member_avatar, :remove_member_avatar, :admin)
    end
end
