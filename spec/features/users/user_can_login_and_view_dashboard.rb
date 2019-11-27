require 'spec_helper'

RSpec.describe "users login page", type: :feature do
  it "can allow a user to view login page" do
    visit "/login"

    expect(last_response.status).to be 200
  end
end