require 'spec_helper'

RSpec.describe "domain names index page", type: :feature do
  it "can see all domain names and expiry dates" do
    domain1 = DomainName.create(domain_name: "loveyou.co", expiry_date: 20200101, user_id: 1)

    visit "/domains"
    expect(page).to have_content(domain1.domain_name)
    expect(page).to have_content("Expiration Date: #{domain1.expiry_date}")
  end
end