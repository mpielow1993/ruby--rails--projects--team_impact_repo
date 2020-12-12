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
<<<<<<< HEAD
    @members = Member.send_chain(member_scope_list).paginate(page: params[:page])
=======
    @members = search(Member.all).paginate(page: params[:page])
>>>>>>> michael/TIMP-7/off-canvas-sidebar
  end

  def show
    @member = Member.find(params[:id])
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    @member.admin? ? flash[:success] = "Admin Removed Successfully" : flash[:success] = "Member Removed Successfully"
    redirect_to admin_members_path
  end

  protected

  # Filter method
  # UNIT TEST
  def search(relation)
    query_string = ''
    filter_form_params = params.fetch(:filter_form, [:first_name, :last_name]) 
    if !filter_form_params.nil? && !filter_form_params.empty?
      if !filter_form_params[:first_name].nil? && !filter_form_params[:first_name].empty?
        query_string += "first_name LIKE '%#{filter_form_params[:first_name]}%'"
      end
      if !filter_form_params[:last_name].nil? && !filter_form_params[:last_name].empty?
        query_string += "last_name LIKE '%#{filter_form_params[:last_name]}%'"
      end
    end
    return query_string.empty? ? relation : relation.where(query_string)
  end

  private

    def admin_member_params
      params.require(:member).permit(
        :user_name, 
        :first_name, 
        :last_name, 
        :email, 
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

    def member_scope_list
      conditions = []
      if !params[:filter_form].nil? && !params[:filter_form].empty?
        if (!params[:filter_form][:user_name].nil? && !params[:filter_form][:user_name].empty?)
          conditions[:user_name] = params[:filter_form][:user_name]
        end
        if (!params[:filter_form][:first_name].nil? && !params[:filter_form][:first_name].empty?)
          conditions[:first_name] = params[:filter_form][:first_name]
        end
        if (!params[:filter_form][:last_name].nil? && !params[:filter_form][:last_name].empty?)
          conditions[:last_name] = params[:filter_form][:last_name]
        end
        if (!params[:filter_form][:email].nil? && !params[:filter_form][:email].empty?)
          conditions[:email] = params[:filter_form][:email]
        end
        if (!params[:filter_form][:phone_no].nil? && !params[:filter_form][:phone_no].empty?)
          conditions[:phone_no] = params[:filter_form][:phone_no]
        end
      end
      return conditions
    end
end
