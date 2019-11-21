require_relative "spec_helper"

def app
  ApplicationController
end

describe ApplicationController do
  it "responds with a good morning message" do
    get '/'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Good Morning!")
  end
end