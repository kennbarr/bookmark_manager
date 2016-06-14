require 'spec_helper'

feature "can add tag to link" do
  scenario "can add single tag to link" do
    visit '/links/new'
    fill_in :title, with: 'Google'
    fill_in :url, with: 'http://www.google.com'
    fill_in :tags, with: 'search'
    click_button :submit

    link = Link.first
    expect(link.tags.map(&:name)).to include('search')
  end

end
