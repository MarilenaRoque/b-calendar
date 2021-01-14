require 'rails_helper'
require 'database_cleaner/active_record'
DatabaseCleaner.strategy = :truncation

describe 'required authentication', type: :feature do
  it 'Should require authetication when root is accessed' do
    visit '/'
    expect(page).to have_content 'Log in'
  end

  it 'Navbar should not have the Logged In Message' do
    visit '/'
    expect(page).to_not have_content 'Logged In'
  end

  it 'Navbar should have a option to REGISTER' do
    visit '/'
    expect(page).to have_content 'REGISTER'
  end
end

describe 'Authenticated User access', type: :feature do
  before :each do
    DatabaseCleaner.clean
    visit 'users/sign_up'
    fill_in 'user_username', with: 'mari1'
    fill_in 'user_email', with: 'mari1@mail.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign up'
  end

  it 'Should have logged in message after authentication' do
    expect(page).to have_content 'You are Logged In, mari'
  end

  it 'Should have access to rooms after authentication' do
    visit '/rooms'
    expect(page).to have_content 'Add Room'
  end

  it 'Should be able to create a new Room after authentication' do
    visit '/rooms/new'
    expect(page).to have_content 'New Room'
  end
end
