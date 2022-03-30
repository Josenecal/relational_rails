class SchoolsController < ApplicationController

  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
    # binding.pry
    @staff_count = School.find(params[:id]).staff_members.length
  end

  def new
  end

  def create
    # binding.pry
    new_school = School.create!(school_params)
    redirect_to "/schools/"
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    # binding.pry
    school = School.find(params[:id])
    school.update!(school_params)
    redirect_to "/schools/#{params[:id]}/"
  end

  def destroy
    school = School.find(params[:id])
    school.destroy
    redirect_to "/schools/"
  end

  private

  def school_params
    {:name => params[:name],
     :mailing_address => params[:mailing_address],
     :max_student_capacity => params[:max_student_capacity].to_i,
     :state_rating => params[:state_rating],
     :is_public => params[:is_public],
     :accepting_new_students => params[:accepting_new_students],
     :calendar_structure => params[:calendar_structure],
     :grades_served => params[:grades_served]}
  end

end
