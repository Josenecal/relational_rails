class SchoolStaffMembersController < ApplicationController

  def index
    @school_staff_members = School.find(params[:id]).staff_members
    @school = School.find(params[:id])
  end
end
