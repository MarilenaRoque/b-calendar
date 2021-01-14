describe 'Meetings views and creation test', type: :feature do
    
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

        
        page.all(:link, 'Add Icon')[10].click
    
    end

    it 'Should display a form with title field' do
        expect(page).to have_field('meeting_title')
    end

    it 'Should display a form with description field' do
        expect(page).to have_field('meeting_description')
    end

    it 'Should display a error message if no time is selected' do
        click_button 'Create Meeting'
        expect(page).to have_content('No time period defined')
    end

    it 'Should display a error message if time is selected but title is not provided' do
        find(:css, "#meeting_times_list_14").set(true)
        click_button 'Create Meeting'
        expect(page).to have_content("Title can't be blank")
    end

    it 'A success message is displayed if the right attributes are provided' do
        find(:css, "#meeting_times_list_14").set(true)
        fill_in 'meeting_title', with: 'meeting title'
        click_button 'Create Meeting'
        expect(page).to have_content("Meeting was successfully created.")
    end

    it 'New meeting is displayed after creation' do
        find(:css, "#meeting_times_list_14").set(true)
        fill_in 'meeting_title', with: 'new meeting title'
        click_button 'Create Meeting'
        expect(page).to have_content("new meeting title")
    end

    
end