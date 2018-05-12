require 'rails_helper'

RSpec.describe WeathersController, type: :controller do
  describe "GET #index" do
    it "returns http success and renders index template" do
      get :index

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    context "when there is weather data" do
      it "returns http success and renders show template" do
        get :show, params: { city: "sydney" }

        expect(response).to have_http_status(:success)
        expect(response).to render_template(:show)
      end
    end

    context "when unable to fetch weather data" do
      it "returns http internal server error and renders show template" do
        get :show, params: { city: "lalaland" }

        expect(response).to have_http_status(:internal_server_error)
        expect(response).to render_template(:show)
      end
    end
  end

  describe "GET #create" do
    context "when there is weather data" do
      before(:each) do
        post :create, params: { city: "melbourne" }
      end

      it "returns http success and renders show template" do
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:show)
      end

      it "returns 1 record in the database" do
        expect(Weather.count).to eq(1)
      end
    end

    context "when unable to fetch weather data for unknown city" do
      before(:each) do
        post :create, params: { city: "lalaland" }
      end

      it "returns http internal server error and renders show template" do
        expect(response).to have_http_status(:internal_server_error)
        expect(response).to render_template(:show)
      end

      it "returns 0 record in the database" do
        expect(Weather.count).to eq(0)
      end
    end
  end
end
