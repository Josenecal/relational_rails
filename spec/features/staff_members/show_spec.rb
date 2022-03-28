require 'rails_helper'

RSpec.describe "staff_members#show" do
  before :each do
    @school_1 = School.create!(name: "Johnson Elementary", mailing_address: "12 School Rd, Springfield CO 80000", max_student_capacity: 350, state_rating: "Improvement", is_public: true, calendar_structure: "semester", grades_served: "k-5")
    @school_2 = School.create!(name: "John. J Flynn Elementary", mailing_address: "5 Colchester Rd, Springfield CO 80000", max_student_capacity: 250, state_rating: "Performance", is_public: true, calendar_structure: "semester", grades_served: "k-5")
    @teaching_staff_1 = @school_1.staff_members.create!(name:"Allard, Judy", role:"Teacher", department: "Math", courses: "[]", pay_rate:45000, pay_type:"salary", qualified_instructor:true)
    @teaching_staff_2 = @school_1.staff_members.create!(name:"Grissum, Bill", role:"Teacher", department: "Phys Ed", courses: "[]", pay_rate:39000, pay_type:"salary", qualified_instructor:true)
    @admin_staff_1 = @school_1.staff_members.create!(name:"Williams, Brian", role:"Principal", department: "Admin", courses: "[]", pay_rate:75000, pay_type:"salary", qualified_instructor:true)
    @admin_staff_2 = @school_1.staff_members.create!(name:"Williams, Brian", role:"Dean of Students", department: "Admin", courses: "[]", pay_rate:70000, pay_type:"salary", qualified_instructor:true)
    @support_staff_1 = @school_1.staff_members.create!(name:"Adams, Douglas", role:"Maintinance Technician", department: "Facilities", courses: "[]", pay_rate:23.50, pay_type:"hourly", qualified_instructor:true)
    @support_staff_2 = @school_1.staff_members.create!(name:"Dvorak, Miriam", role:"Cook", department: "Kitchen", courses: "[]", pay_rate:75000, pay_type:"salary", qualified_instructor:true)
    @teaching_staff_3 = @school_2.staff_members.create!(name:"Weisenstien, Geoffry", role:"Teacher", department: "Writing", courses: [], pay_rate:35000, pay_type:"salary", qualified_instructor:true)
    @teaching_staff_4 = @school_2.staff_members.create!(name:"Cliffords, Kelly", role:"Teacher", department: "Reading", courses: [], pay_rate:36000, pay_type:"salary", qualified_instructor:true)
    @teaching_staff_5 = @school_2.staff_members.create!(name:"Burgouise, Francis", role:"Teacher", department: "Electives", courses: [], pay_rate:35000, pay_type:"salary", qualified_instructor:true)
    @admin_staff_3 =  @school_2.staff_members.create!(name:"Maxwell, Francine", role:"Counselor", department: "Student Support", courses: [], pay_rate:39000, pay_type:"salary", qualified_instructor:true)
    @admin_staff_4 =  @school_2.staff_members.create!(name:"Richards, Whitny", role:"Counselor", department: "Student Support", courses: [], pay_rate:42000, pay_type:"salary", qualified_instructor:true)
  end

  it "Shows a single staff member's atributes" do
    visit "/staff_members/#{@admin_staff_3.id}"

    expect(page).to have_content('39000')

    visit "/staff_members/#{@admin_staff_1.id}"

    expect(page).to have_content('75000')

    visit"/staff_members/#{@teaching_staff_3.id}"

    expect(page).to have_content('Writing')

    visit"/staff_members/#{@support_staff_1.id}"

    expect(page).to have_content('Adams, Douglas')
  end

end
