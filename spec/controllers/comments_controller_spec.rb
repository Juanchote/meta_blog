require 'rails_helper'

RSpec.describe CommentsController do
  describe "#create" do
    let(:blog_entry) { FactoryGirl.create(:blog_entry) }

    context "with valid values" do
      json = {"title" => "test title",
              "post" => "test body"
              }
      before { post :create, :comment => json, :blog_entry_id => blog_entry.id, :format => :json }

      it { expect(response).to have_http_status(:created) }
    end

    context "with invalid values" do
      json = { "title" => "just title" }

      before { post :create, :comment => json, :blog_entry_id => blog_entry.id, :format => :json }

      it {expect(response).to have_http_status(:unprocessable_entity)}
    end
  end

  describe "#index" do
    let(:blog_entry) { FactoryGirl.create(:blog_entry) }

    before { get :index, { :blog_entry_id => blog_entry.id }, :format => :json }
    it { expect(response).to have_http_status(:ok) }
  end

  describe "#show" do
    context "with valid id" do
      let(:comment) { FactoryGirl.create(:comment) }

      before { get :show, { :blog_entry_id => comment.blog_entry_id, :id => comment.id }, :format => :json }
      it { expect(response).to have_http_status(:ok) }
    end

    context "with invalid id" do
      before { get :show, { :blog_entry_id => -1, :id => -1 }, :format => :json }
      it { expect(response).to have_http_status(:not_found) }
    end
  end

  describe "#destroy" do
    let(:comment) { FactoryGirl.create(:comment) }

    before { delete :destroy, { :blog_entry_id => comment.blog_entry_id, :id => comment.id }, :format => :json }

    it { expect(response).to have_http_status(:ok) }
  end
end