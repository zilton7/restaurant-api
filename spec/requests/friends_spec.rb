require 'rails_helper'

RSpec.describe 'Friend', type: :feature do
  it 'creates a friend if given valid params' do
    post '/api/v1/friends', params: { name: 'tester', email: 'tester@gmail.com', user_id: 1 }
    expect(response).to have_http_status(:created)
  end
end
