require 'rails_helper'

RSpec.describe 'Staff Member Controlled Features' do

  before :each do
    @teaching_staff_1 = school_1.staff_members.create!(name:"Allard, Judy", role:"Teacher", department: "Math", courses: "[]", pay_rate:45000, pay_type:"salary", qualified_instructor:true)
    @teaching_staff_2 = school_1.staff_members.create!(name:"Grissum, Bill", role:"Teacher", department: "Phys Ed", courses: "[]", pay_rate:39000, pay_type:"salary", qualified_instructor:true)
    @admin_staff_1 = school_1.staff_members.create!(name:"Williams, Brian", role:"Principal", department: "Admin", courses: "[]", pay_rate:75000, pay_type:"salary", qualified_instructor:true)
    @admin_staff_2 = school_1.staff_members.create!(name:"Williams, Brian", role:"Dean of Students", department: "Admin", courses: "[]", pay_rate:70000, pay_type:"salary", qualified_instructor:false)
    @support_staff_1 = school_1.staff_members.create!(name:"Adams, Douglas", role:"Maintinance Technician", department: "Facilities", courses: "[]", pay_rate:23.50, pay_type:"hourly", qualified_instructor:false)
    @support_staff_2 = school_1.staff_members.create!(name:"Dvorak, Miriam", role:"Cook", department: "Kitchen", courses: "[]", pay_rate:75000, pay_type:"salary", qualified_instructor:false)
    @teaching_staff_3 = school_2.staff_members.create!(name:"Weisenstien, Geoffry", role:"Teacher", department: "Writing", courses: [], pay_rate:35000, pay_type:"salary", qualified_instructor:true)
    @teaching_staff_4 = school_2.staff_members.create!(name:"Cliffords, Kelly", role:"Teacher", department: "Reading", courses: [], pay_rate:36000, pay_type:"salary", qualified_instructor:true)
    @teaching_staff_3 = school_2.staff_members.create!(name:"Burgouise, Francis", role:"Teacher", department: "Electives", courses: [], pay_rate:35000, pay_type:"salary", qualified_instructor:true)
    @admin_staff_3 =  school_2.staff_members.create!(name:"Maxwell, Francine", role:"Counselor", department: "Student Support", courses: [], pay_rate:39000, pay_type:"salary", qualified_instructor:false)
    @admin_staff_4 =  school_2.staff_members.create!(name:"Richards, Whitny", role:"Counselor", department: "Student Support", courses: [], pay_rate:42000, pay_type:"salary", qualified_instructor:true)
  end

  context '/staff_members' do
    it 'Shows all of the staff members in the system and their attributes' do
      visit'/staff_members'

      expect(page).to have_content(@admin_staff_4.name)
      expect(page).to have_content(@admin_staff_2.role)
      expect(page).to have_content(@teaching_staff_1.name)
      expect(page).to have_content(@teaching_staff4.department)
      expect(page).to have_content(@support_staff_2.pay_rate)
      expect(page).to have_content(@support_staff_1.name)
      expect(page).to have_content(@admin_staff_1.pay_type)
    end
  end

  context '/staff_members/:id' do
    visit"staff_members/#{@admin_staff_3.id}"

    expect(page).to have_content('39000')

    visit "staff_members/#{@admin_staff_1.id}"

    expect(page).to have_content('75000')

    visit"staff_members/#{@teaching_staff_3.id}"

    expect(page).to have_content('Writing')

    visit"staff_members/#{@support_staff_1.id}"

    expect(page).to have_content('Adams, Douglas')


  end
end