class Admin::MembersController < Admin::AdminApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new
    @member = Member.create(admin_member_params)
    if @member.save
      @member.create_activation_digest
      @member.create_reset_digest 
      @member.send_admin_activation_email 
      @member_type = @member.admin? ? "admin" : "member"
      flash[:info] = "Email sent to submitted address for new #{@member_type} with account activation instructions"
      redirect_to admin_members_path
    else
      flash.now[:danger] = "An error occurred creating this member"
      render 'admin/members/new'
    end
  end

  def edit
    @member = Member.find(params[:id])
    check_existence(@member, admin_members_path, "Member not found")
  end

  def update
    @member = Member.find(params[:id])
    check_existence(@member, admin_members_path, "Member not found")
    @member.update(admin_member_params)
    if @member.save
      flash[:success] = @member.admin? ?  "Admin Updated Successfully" : "Member Updated Successfully"
      redirect_to admin_members_path
    else
      flash.now[:danger] = "An error occurred updating the selected member"
      render 'admin/members/edit'
    end
  end

  def index
    @members = Member.send_chain(scope_hash).paginate(page: params[:page])
  end

  def show
    @member = Member.find(params[:id])
    check_existence(@member, admin_members_path, "Member not found")
  end

  def destroy
    @member = Member.find(params[:id])
    check_existence(@member, admin_members_path, "Member not found")
    @member_type = @member.admin? ? "admin" : "member"
    if @member.destroy
      flash[:success] = "Selected #{@member_type} removed successfully"
      redirect_to admin_members_path
    else
      flash.now[:danger] = "An error occurred removing the selected #{@member_type}. Please try again."
      render 'admin/members/index'
    end
  end

  private

    def admin_member_params
      params.require(:member).permit(
        :user_name, 
        :first_name, 
        :last_name, 
        :phone_no, 
        :password, 
        :password_confirmation, 
        :avatar, 
        :remove_avatar, 
        :admin
      )
    end

    def admin_member_search_params
      [ 
        :first_name, 
        :last_name
      ]
    end

    def scope_hash
      conditions = Hash.new
      if !params[:filter_form].nil? && !params[:filter_form].empty?
        if (!params[:filter_form][:user_name].nil? && !params[:filter_form][:user_name].empty?)
          conditions[:user_name_like] = params[:filter_form][:user_name]
        end
        if (!params[:filter_form][:first_name].nil? && !params[:filter_form][:first_name].empty?)
          conditions[:first_name_like] = params[:filter_form][:first_name]
        end
        if (!params[:filter_form][:last_name].nil? && !params[:filter_form][:last_name].empty?)
          conditions[:last_name_like] = params[:filter_form][:last_name]
        end
        if (!params[:filter_form][:phone_no].nil? && !params[:filter_form][:phone_no].empty?)
          conditions[:phone_no_like] = params[:filter_form][:phone_no]
        end
      end
      return conditions
    end
end

