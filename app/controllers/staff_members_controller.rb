class StaffMembersController < ApplicationController

  def index
    @staff_members = StaffMember.all
  end

  def show
    @staff_member = StaffMember.find(params[:id])
  end

  def edit
    @staff_member = StaffMember.find(params[:id])
  end

end
