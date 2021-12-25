require "application_system_test_case"

class WorkFilesTest < ApplicationSystemTestCase
  setup do
    log_in users(:with_password)
    @work_file = work_files(:one)
  end

  test "creating a work file" do
    visit new_work_file_url
    fill_in "Name", with: "new"
    click_on I18n.t("helpers.submit.create")
    assert_text I18n.t("notices.created", record: WorkFile.model_name.human)
  end

  test "updating a work file" do
    visit edit_work_file_url(@work_file)
    fill_in "Name", with: @work_file.name
    click_on I18n.t("helpers.submit.update")
    assert_text I18n.t("notices.updated", record: WorkFile.model_name.human)
  end

  test "destroying a work file" do
    visit work_file_url(@work_file)
    click_on I18n.t("actions.destroy")
    assert_text I18n.t("notices.destroyed", record: WorkFile.model_name.human)
  end
end
