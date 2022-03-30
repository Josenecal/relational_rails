class SchoolStaffMembersController < ApplicationController

  def index
    # binding.pry
    if params[:limit_by_pay]
      all_school_staff = School.find(params[:id]).alphabetical
      @school_staff_members = all_school_staff.by_salary(params[:limit_by_pay])
    else
      @school_staff_members = School.find(params[:id]).alphabetical
    end
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
