class StaffMembersController < ApplicationController

  def index
    @staff_members = StaffMember.active
  end

  def show
    @staff_member = StaffMember.find(params[:id])
  end

  def edit
    @staff_member = StaffMember.find(params[:id])
  end

  def update
    StaffMember.find(params[:id]).update(update_staff_member_params)
    redirect_to "/staff_members/#{params[:id]}/"
  end

  private

   def update_staff_member_params
     {
       name: params[:name],
       role: params[:role],
       department: params[:department],
       pay_rate: params[:pay_rate],
       pay_type: params[:pay_type],
       qualified_instructor: params[:qualified_instructor],
       courses: params[:courses],
       :active_employee => params[:active_employee]
     }
   end

end
