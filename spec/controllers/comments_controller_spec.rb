require 'rails_helper'

RSpec.describe CommentsController do
  describe "#create" do
    let(:blog_entry) { FactoryGirl.create(:blog_entry) }

    describe ":created" do
      json = {"title" => "test title",
              "post" => "test body"
              }
      before { get :create, :comment => json, :id => blog_entry.id }

      it { expect(response).to have_http_status(:created) }
    end

    describe ":unprocessable_entity" do
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
    describe ":ok" do
      let(:comment) { FactoryGirl.create(:comment) }

      before { get :show, :id => comment.id }
      it { expect(response).to have_http_status(:ok) }
    end

    describe ":not_found" do
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