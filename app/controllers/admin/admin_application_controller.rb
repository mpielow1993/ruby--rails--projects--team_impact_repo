class Admin::AdminApplicationController < ApplicationController
    before_action :logged_in_member, :admin_member
end
