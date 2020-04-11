require 'rails_helper'

describe 'GET /users' do
  it 'returns success status' do
    get users_path
    expect(response).to have_http_status(200)
  end

  it 'the users title is present' do
    users = create_list(:user, 3)
    get users_path
    users.each{ |user| expect(response.body).to include(user.title) }
  end
end

describe 'POST /users' do
  context 'when it has valid parameters' do
    it 'creates the user with correct attributes' do
      user_attributes = FactoryBot.attributes_for(:user)
      post users_path, params: {user: user_attributes}
      expect(User.last).to have_attributes(user_attributes)
    end
  end

  context 'when it has no valid parameters' do
    it "doesn't create user" do
      expect{
        post users_path, params: { user: {kind: '', name: '', level: '' }}
      }.to_not change(User, :count)
    end
  end
end