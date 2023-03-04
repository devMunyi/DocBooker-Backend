require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns all users" do
      user1 =  FactoryBot.create(:user, username: "testuser1")
      user2 =  FactoryBot.create(:user, username: "testuser2")
      get :index
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe "GET #show" do
    let!(:user) { FactoryBot.create(:user, username: "testuser") }

    it "returns http success" do
      get :show, params: { id: user.username }
      expect(response).to have_http_status(:success)
    end

    it "returns the user" do
      get :show, params: { id: user.username }
      expect(JSON.parse(response.body)["username"]).to eq(user.username)
    end

    it "returns a 404 when the user does not exist" do
      get :show, params: { id: "invalid_username" }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new user" do
        expect {
          post :create, params: { user: { username: "testuser" } }
        }.to change(User, :count).by(1)
      end

      it "returns the new user with a 201 status" do
        post :create, params: { user: { username: "testuser" } }
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)["username"]).to eq("testuser")
      end
    end

    context "with invalid params" do
      let!(:existing_user) { FactoryBot.create(:user, username: "testuser") }

      it "does not create a new user" do
        expect {
          post :create, params: { user: { username: "testuser" } }
        }.to change(User, :count).by(0)
      end

      it "returns an error message with a 422 status" do
        post :create, params: { user: { username: "testuser" } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)["errors"]).to include("Username has already been taken")
      end
    end
  end
end
