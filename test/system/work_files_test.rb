require "application_system_test_case"

class WorkFilesTest < ApplicationSystemTestCase
  setup do
    log_in users(:project_manager)
    @work_file = work_files(:one)
  end

  test "creating a work_file" do
    visit new_work_file_url
    fill_in WorkFile.human_attribute_name(:name), with: "new"
    click_button I18n.t("helpers.submit.create")
    assert_text I18n.t("notices.created", record: WorkFile.model_name.human)
  end

  test "updating a work_file" do
    visit edit_work_file_url(@work_file)
    fill_in WorkFile.human_attribute_name(:name), with: @work_file.name
    click_button I18n.t("helpers.submit.update")
    assert_text I18n.t("notices.updated", record: WorkFile.model_name.human)
  end

  test "destroying a work_file" do
    visit work_file_url(@work_file)
    accept_confirm { click_button I18n.t("views.actions.destroy") }
    assert_text I18n.t("notices.destroyed", record: WorkFile.model_name.human)
  end
end
