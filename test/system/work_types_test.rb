require "application_system_test_case"

class WorkTypesTest < ApplicationSystemTestCase
  setup do
    log_in users(:manager)
    @work_type = work_types(:one)
  end

  test "creating a work_type" do
    visit new_work_type_url
    fill_in WorkType.human_attribute_name(:name), with: "new"
    fill_in WorkType.human_attribute_name(:multiplicand), with: @work_type.multiplicand
    click_button I18n.t("helpers.submit.create")
    assert_text I18n.t("notices.created", record: WorkType.model_name.human)
  end

  test "updating a work_type" do
    visit edit_work_type_url(@work_type)
    fill_in WorkType.human_attribute_name(:name), with: @work_type.name
    fill_in WorkType.human_attribute_name(:multiplicand), with: @work_type.multiplicand
    click_button I18n.t("helpers.submit.update")
    assert_text I18n.t("notices.updated", record: WorkType.model_name.human)
  end

  test "destroying a work_type" do
    visit work_type_url(@work_type)
    accept_confirm { click_button I18n.t("views.actions.destroy") }
    assert_text I18n.t("notices.destroyed", record: WorkType.model_name.human)
  end
end
