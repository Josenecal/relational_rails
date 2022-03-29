class SchoolStaffMembersController < ApplicationController

  def index
    @school_staff_members = School.find(params[:id]).staff_members
    @school = School.find(params[:id])
  end

  def new
    @school = School.find(params[:id])
  end

  def create
    School.find(params[:school_id]).staff_members.create!(new_staff_member_params)
    redirect_to "/schools/#{params[:school_id]}/staff_members/"
  end

  private

  def new_staff_member_params
    {
      name: params[:name],
      role: params[:role],
      department: params[:department],
      pay_rate: params[:pay_rate],
      pay_type: params[:pay_type],
      qualified_instructor: params[:qualified_instructor],
      :active_employee => params[:active_employee],
      courses: "[]"
    }
  end
end
