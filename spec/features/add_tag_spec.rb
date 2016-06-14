require 'spec_helper'

feature "can add tags to a link" do
  scenario "can add single tag to link" do
    visit '/links/new'
    fill_in :title, with: 'Google'
    fill_in :url, with: 'http://www.google.com'
    fill_in :tags, with: 'search'
    click_button :submit

    link = Link.first
    expect(link.tags.map(&:name)).to include('search')
  end

  scenario "can add multiple tags to link" do
    visit '/links/new'
    fill_in :title, with: 'Google'
    fill_in :url, with: 'http://www.google.com'
    fill_in :tags, with: 'search, huge, wealthy'
    click_button :submit

    link = Link.first
    expect(link.tags.map(&:name)).to include('search')
    expect(link.tags.map(&:name)).to include('huge')
    expect(link.tags.map(&:name)).to include('wealthy')
  end

end
