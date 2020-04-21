require 'rails_helper'

RSpec.describe "Enemies", type: :request do
  describe "PUT /enemies" do
    context 'when the enemy exists' do
      let(:enemy) { create(:enemy) }
      let(:enemy_attributes) { attributes_for(:enemy) }

      before(:each) {put "/enemies/#{enemy.id}", params: enemy_attributes }
      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'updates the enemy' do
        expect(enemy.reload).to have_attributes(enemy_attributes)
      end
      it 'returns the enemy updated' do
        expect(enemy.reload).to have_attributes(json.except('created_at', 'updated_at'))
      end
    end

    context 'when the enemy does not exist' do
      before(:each) { put '/enemies/0', params: attributes_for(:enemy) }
      it 'returns status code 204' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Enemy/)
      end
    end
  end

  describe 'Delete /enemies'do
    context 'when the enemy exist' do
      let(:enemy) { create(:enemy) }
      before(:each) { delete "/enemies/#{enemy.id}" }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'destroy the record' do
        expect{enemy.reload}.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context 'when the enemy does not exist' do
      before(:each) { delete '/enemies/0' }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Enemy/)
      end
    end
  end

  describe 'GET /enemies#index' do
    context 'successfully' do
      before(:each) { get enemies_path}
      it 'return status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET /enemies/#show' do
    
    context 'successfully' do
      let(:enemy) { create(:enemy) }
      before(:each) { get "/enemies/#{enemy.id}" }
      it 'returns especific enemy informations and status 200' do
        expect(enemy).to have_attributes(json.except('created_at', 'updated_at'))
        expect(response).to have_http_status(:ok)
      end
    end

    context 'unsuccessfully' do
      before(:each) { put '/enemies/0', params: attributes_for(:enemy) }
      it 'when the enemy does not exist and returns not found record' do
        expect(response).to have_http_status(404)
        expect(response.body).to match(/Couldn't find Enemy/)
      end
    end
  end

  describe 'POST /enemies#create' do
    context 'successfully' do
      it 'create a enemy with correct parameters and return status code 200' do
        enemy_attributes = attributes_for(:enemy)
        post enemies_path, params: enemy_attributes
        expect(Enemy.last).to have_attributes(enemy_attributes)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'unsuccessfully' do
      it 'Does not create a enemy and return status code 422' do
        expect{
          post enemies_path, params: {
            enemy: {kind: '', name: '', level: '', power_step: '', power_base: '' }}
        }.to_not change(Enemy, :count)
        expect(response).to have_http_status(422)
      end
    end
  end
end
