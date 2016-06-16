
def create_link_makers
  visit('/links/new')
  fill_in(:url, with: 'www.makersacademy.com')
  fill_in(:title, with: 'Makers Academy')
  fill_in(:tags, with: 'coding, education')
  click_button('Create Link')
end

def create_link_bubbles
  visit('/links/new')
  fill_in(:url, with: 'www.effervescent.com')
  fill_in(:title, with: 'Effervescent champagne')
  fill_in(:tags, with: 'bubbles')
  click_button('Create Link')
end

def sign_up
  visit('/')
  click_link('Sign Up')
  fill_in(:email, with: 'riya.pabari@gmail.com')
  fill_in(:password, with: 'password')
  fill_in(:password_confirmation, with: 'password')
  click_button('Submit')
end

def sign_up_pw_mismatch
  visit('/')
  click_link('Sign Up')
  fill_in(:email, with: 'riya.pabari@gmail.com')
  fill_in(:password, with: 'password')
  fill_in(:password_confirmation, with: 'different')
  click_button('Submit')
end

def sign_up_no_email
  visit('/')
  click_link('Sign Up')
  fill_in(:password, with: 'password')
  fill_in(:password_confirmation, with: 'password')
  click_button('Submit')
end

def sign_up_bad_email
  visit('/')
  click_link('Sign Up')
  fill_in(:email, with: 'riya')
  fill_in(:password, with: 'password')
  fill_in(:password_confirmation, with: 'password')
  click_button('Submit')
end

def sign_in
  visit('/users/sign_in')
  fill_in(:email, with: 'riya.pabari@gmail.com')
  fill_in(:password, with: 'password')
  click_button('Sign In')
end

def sign_in_wrong_password
  visit('/users/sign_in')
  fill_in(:email, with: 'riya.pabari@gmail.com')
  fill_in(:password, with: 'different')
  click_button('Sign In')
end
