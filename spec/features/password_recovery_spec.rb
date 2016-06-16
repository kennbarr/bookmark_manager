feature 'password recovery' do
  scenario 'user can ask for password reset' do
    visit 'users/sign_in'
    click_button 'Forgot your password?'
    expect(page).to have_selector "input[value='Reset Password']"
  end

  scenario 'can submit email for recovery and receive acknowledgement' do
    sign_up
    visit 'users/sign_in'
    click_button 'Forgot your password?'
    fill_in(:email, with: 'riya.pabari@gmail.com')
    click_button 'Reset Password'
    expect(page).to have_content 'You can now reset your password'
  end

end
