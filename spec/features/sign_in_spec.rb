require 'spec_helper'

feature "sign up new users" do
  scenario "single user signs up" do
    visit '/signup'
    fill_in :username, with: 'Bob'
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'test123'
    click_button 'Sign up!'

    expect(User.count).to eq 1

    expect(page).to have_content "Welcome, Bob!"

    expect(User.first.email).to eq 'test@test.com'

  end

  scenario "welcome" do
    visit '/signup'
    fill_in :username, with: 'Bob'
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'test123'
    click_button 'Sign up!'

    expect(page).to have_content "Welcome, Bob!"


  end

  scenario "email" do
    visit '/signup'
    fill_in :username, with: 'Bob'
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'test123'
    click_button 'Sign up!'

    expect(User.first.email).to eq 'test@test.com'

  end



end
