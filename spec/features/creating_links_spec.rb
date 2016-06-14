require 'spec_helper'

feature "creating links" do
  scenario "create a new link and see it on links page" do
    visit '/links/new'
    fill_in :title, with: 'Google'
    fill_in :url, with: 'http://www.google.com'
    click_button :submit

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content 'Google'
    end
  end

end
