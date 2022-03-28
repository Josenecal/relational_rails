class SchoolStaffMembersController < ApplicationController

  def index
    @school_staff_members = School.find(params[:id]).staff_members
    @school_name = School.find(params[:id]).name
  end
end
