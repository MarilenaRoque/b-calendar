describe 'Room views and creation test', type: :feature do
  before :each do
    DatabaseCleaner.clean

    # Authentication required to have access to the feature
    visit 'users/sign_up'
    fill_in 'user_username', with: 'mari1'
    fill_in 'user_email', with: 'mari1@mail.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign up'

    # Creating room for tests
    visit 'rooms/new'
    fill_in 'room_number', with: '2050'
    click_button 'Create Room'
  end

  it 'Should receive success message if enter with the right paramater' do
    expect(page).to have_content('Room was successfully created')
  end

  it 'Should Redirect to display calendar of the room after successful creation' do
    expect(page).to have_content('Room: 2050')
  end

  it 'Should render a calendar table in the show view of the room' do
    expect(page.has_table?).to be true
  end

  it 'Should receive a warning if try to create a room with empty number' do
    visit '/rooms/new'
    click_button 'Create Room'
    expect(page).to have_content("can't be blank")
  end

  it 'Should display an error message if the number of the room is not unique' do
    visit '/rooms/new'
    fill_in 'room_number', with: '2050'
    click_button 'Create Room'
    expect(page).to have_content('Number has already been taken')
  end
end
