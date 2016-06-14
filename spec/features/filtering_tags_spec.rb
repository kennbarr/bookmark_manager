require 'spec_helper'

feature "filtering tags" do
  scenario "can filter by a single tag" do
    visit '/links/new'
    fill_in :title, with: 'Google'
    fill_in :url, with: 'http://www.google.com'
    fill_in :tags, with: 'bubbles'
    click_button :submit
    visit '/links/new'
    fill_in :title, with: 'Yahoo'
    fill_in :url, with: 'http://www.yahoo.com'
    fill_in :tags, with: 'rocks'
    click_button :submit
    visit '/tags/bubbles'

    within 'ul#links' do
      expect(page).not_to have_content 'Yahoo'
      expect(page).to have_content 'Google'
    end
  end

end
