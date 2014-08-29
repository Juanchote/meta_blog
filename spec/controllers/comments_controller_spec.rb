require 'rails_helper'

RSpec.describe CommentsController do
  describe "#create" do
    let(:blog_entry) { FactoryGirl.create(:blog_entry) }

    context "with valid values" do
      json = {"title" => "test title",
              "post" => "test body"
              }
      before { get :create, :comment => json, :id => blog_entry.id }

      it { expect(response).to have_http_status(:created) }
    end

    context "with invalid values" do
      json = { "title" => "just title" }

      before { get :create, :comment => json, :id => blog_entry.id }

      it {expect(response).to have_http_status(:unprocessable_entity)}
    end
  end

  describe "#index" do
    let(:blog_entry) { FactoryGirl.create(:blog_entry) }

    before { get :index, :id => blog_entry.id }
    it { expect(response).to have_http_status(:ok) }
  end

  describe "#show" do
    context "with valid id" do
      let(:comment) { FactoryGirl.create(:comment) }

      before { get :show, :id => comment.id }
      it { expect(response).to have_http_status(:ok) }
    end

    context "with invalid id" do
      before { get :show, :id => -1 }
      it { expect(response).to have_http_status(:not_found) }
    end
  end

  describe "#destroy" do
    let(:comment) { FactoryGirl.create(:comment) }

    before { delete :destroy, :id => comment.id }

    it { expect(response).to have_http_status(:ok) }
  end
end