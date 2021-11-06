# require 'rails_helper'

# RSpec.describe 'Friends', type: :request do
#   describe 'GET /index' do
#     pending "add some examples (or delete) #{__FILE__}"
#   end
# end

require 'rails_helper'

RSpec.describe 'Friend', type: :feature do
  let(:user) do
    User.create(name: 'test_user', email: 'testuser@gmail.com',
                password: '123456')
  end
  let(:testuser) do
    User.create(name: 'test_user2', email: 'testuser2@gmail.com',
                password: '123456')
  end

  scenario 'add friend' do
    # visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')
    click_link('All users')
    expect(page).to have_content 'See Profile'
  end
end
