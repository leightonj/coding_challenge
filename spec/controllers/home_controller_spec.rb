require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  render_views

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  describe 'Search movies' do
    it 'Raises an error if blank search term provided' do
      get :index, params: { username: @user.username, usertoken: @user.usertoken }
      get :index, params: { username: @user.username, usertoken: @user.usertoken, year: '2000', word: '' }
      expect(response).to have_http_status(:bad_request)
    end

    it 'Raises an error if blank search year provided' do
      get :index, params: { username: @user.username, usertoken: @user.usertoken, word: 'star' }
      get :index, params: { username: @user.username, usertoken: @user.usertoken, word: 'star', year: '' }
      expect(response).to have_http_status(:bad_request)
    end

    it 'Returns ok if word and year supplier' do
      get :index, params: { username: @user.username, usertoken: @user.usertoken, word: 'star', year: '2000' }
      expect(response).to have_http_status(:ok)
    end

    it 'Returns bad request if no search results found' do
      get :index, params: { username: @user.username, usertoken: @user.usertoken, word: 'starsssss', year: '2000' }
      expect(response).to have_http_status(:bad_request)
    end
  end
end
