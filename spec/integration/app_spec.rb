# file: spec/integration/application_spec.rb

require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  # context "GET to /" do
  #   it "returns 200 OK with the right content" do
  #     # Send a GET request to /
  #     # and returns a response object we can test.
  #     response = get("/", names: "Julia, Mary, Karim")

  #     # Assert the response status code and body.
  #     expect(response.status).to eq(200)
  #     expect(response.body).to eq("Julia, Mary, Karim")
  #   end
  # end

  context "POST to /submit" do
    it "returns 200 OK with the right content" do
      # Send a POST request to /submit
      # with some body parameters
      # and returns a response object we can test.
      response = post("/submit", name: "Dana", some_other_param: 12)

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Dana")
    end
  end

  context "POST /sort-names" do
    it "sorts a list of names in alphabetical order" do
      response = post("/sort-names", names: "Alice,Joe,Julia,Kieran,Zoe")

      expect(response.status).to eq(200)
      expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
    end
  end 
  
  context "GET to /" do
    it "conatains a h1 title" do
      response = get('/')

      expect(response.body).to include ('<h1>Hello!</h1>')
    end
    
    it "contains a div" do
      response = get('/')

      expect(response.body).to include('<div>')
    end  
  end    
end
