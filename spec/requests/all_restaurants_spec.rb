require 'rails_helper'

RSpec.describe 'AllRestaurants', type: :request do
  before(:example) do
    @all_restaurant = AllRestaurant.create(name: 'Kushi Tsuru', opening_date: 'Mon-Sun 11:30 am - 9 pm')
  end

  it 'shows all all_restaurants' do
    get '/api/v1/all_restaurants'
    expect(response).to have_http_status(:ok)
  end

  it 'displays all_restaurant information' do
    get "/api/v1/all_restaurants/#{@all_restaurant.id}"
    expect(response).to have_http_status(:ok)
  end
end
