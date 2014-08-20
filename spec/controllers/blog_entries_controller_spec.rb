require 'rails_helper'

RSpec.describe BlogEntriesController do
	describe "#index" do
		before { get :index }
	 	it { expect(response).to have_http_status(:ok) }
  end

  describe "#show" do
    describe ":ok" do
      let(:blog_entry) { FactoryGirl.create(:blog_entry) }
      before { get :show, :id => blog_entry.id }
      it { expect(response).to have_http_status(:ok) }
    end

    describe ":not_found" do
      before { get :show, :id => -1 }
      it { expect(response).to have_http_status(:not_found) }
    end
  end
end