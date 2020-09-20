require 'rails_helper'

RSpec.describe '/users', type: :feature do
  context 'with a few records' do
    before(:each) do
      create_list(:fake_users, 3)
    end
    it 'Pagination is not displayed' do
      visit users_path
      expect(page).to have_no_xpath("/html/body/div[@class='pagination']")
    end
  end

  context 'with over 30 records' do
    before(:each) do
      create_list(:fake_users, 40)
    end
    it 'Pagination is displayed' do
      visit users_path
      expect(page).to have_xpath("/html/body/div[@class='pagination']")
    end

    it '2ページ目をクリックしたとき、ページが表示されること' do
      visit users_path
      find(:xpath, "/html/body/div[@class='pagination']/ul/li[3]/a[text()='2']").click
      expect(page.status_code).to eq(200)
    end
  end
end
