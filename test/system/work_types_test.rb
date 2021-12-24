require "application_system_test_case"

class WorkTypesTest < ApplicationSystemTestCase
  setup do
    log_in users(:with_password)
    @work_type = work_types(:one)
  end

  test "creating a work type" do
    visit new_work_type_url
    fill_in "Name", with: "new"
    fill_in "Multiplicand", with: @work_type.multiplicand
    click_on "Create"
    assert_text I18n.t("notices.created", record: WorkType.model_name.human)
  end

  test "updating a work type" do
    visit edit_work_type_url(@work_type)
    fill_in "Name", with: @work_type.name
    fill_in "Multiplicand", with: @work_type.multiplicand
    click_on "Update"
    assert_text I18n.t("notices.updated", record: WorkType.model_name.human)
  end

  test "destroying a work type" do
    visit work_type_url(@work_type)
    click_on "Destroy"
    assert_text I18n.t("notices.destroyed", record: WorkType.model_name.human)
  end
end
