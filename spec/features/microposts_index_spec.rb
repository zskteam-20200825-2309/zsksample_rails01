require 'rails_helper'

RSpec.feature 'MicropostsIndex', type: :feature do
  context 'with few records' do
    it 'does not paginate records' do
      create(:user)
      create_list(:fake_micropost, 20)
      visit '/microposts'
      expect(page).to have_no_xpath("//*[@class='pagination']//a[text()='2']")
    end
  end

  context 'with many records' do
    it 'paginates records' do
      create(:user)
      create_list(:fake_micropost, 50)
      visit '/microposts'
      expect(page).to have_xpath("//*[@class='pagination']//a[text()='2']")
      find("//*[@class='pagination']//a[text()='2']").click
      expect(page.status_code).to eq(200)
    end
  end
end
