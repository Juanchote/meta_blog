require 'rails_helper'

RSpec.describe BlogEntriesController do
  describe "#create" do
    context "with valid values" do
      context "and json format" do
        json = {
          "title" => "test title",
          "post" => "test body"
        }
        before { post :create, :blog_entry => json, :format => :json }
        it { expect(response).to have_http_status(:created) }
      end
      # context "and html format" do
      #   before { visit new_blog_entry }
      # end
    end

    context "with invalid values" do
      json = {"title" => "just title"}

      before { post :create, :blog_entry => json, :format => :json }

      it {expect(response).to have_http_status(:unprocessable_entity)}
    end
  end

  describe "#index" do
    before { get :index, :format => :json }
    it { expect(response).to have_http_status(:ok) }
  end

  describe "#show" do
    context "with valid id" do
      let(:blog_entry) { FactoryGirl.create(:blog_entry) }

      before { get :show, :id => blog_entry.id, :format => :json }
      it { expect(response).to have_http_status(:ok) }
    end

    context "with invalid id" do
      before { get :show, :id => -1, :format => :json }
      it { expect(response).to have_http_status(:not_found) }
    end
  end

  describe "#destroy" do
    let(:blog_entry) { FactoryGirl.create(:blog_entry) }

    before { delete :destroy, :id => blog_entry.id, :format => :json }

    it { expect(response).to have_http_status(:ok) }
  end
end