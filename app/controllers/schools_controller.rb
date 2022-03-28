class SchoolsController < ApplicationController

  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
    # binding.pry
    @staff_count = School.find(params[:id]).staff_members.length
  end

end
