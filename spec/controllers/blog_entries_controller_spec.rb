require 'rails_helper'

RSpec.describe BlogEntriesController do
	describe "#index" do
	#it "#index" do
	 before { get :index }
	 it { expect(response).to have_http_status(200) }
  end
end