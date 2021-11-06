require 'rails_helper'

RSpec.describe 'Collections', type: :request do
  before(:example) do
    @user = User.create(username: 'test_user', email: 'testuser@gmail.com', password: '1234')
    @collection = Collection.create(vegetarian_favorites: 'Herbivore', meat_lovers: 'Shanghai China Restaurant',
                                    user_id: 1)
    token = JWT.encode({ user_id: @user.id }, Rails.application.secret_key_base)
    @headers = { Authorization: "Bearer #{token}" }
  end

  it 'shows all collections' do
    get '/api/v1/collections', headers: @headers
    expect(response).to have_http_status(:ok)
  end

  it 'displays collection information' do
    get "/api/v1/collections/#{@collection.id}", headers: @headers
    expect(response).to have_http_status(:ok)
  end
end
