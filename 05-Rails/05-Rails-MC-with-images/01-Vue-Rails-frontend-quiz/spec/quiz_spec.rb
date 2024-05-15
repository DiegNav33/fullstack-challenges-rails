require "quiz"

describe "quiz" do
  describe "#rails_app" do
    it "should return the correct answer" do
      expect(rails_app).to eq("rails new watch-list")
    end
  end

  describe "#modern_javascript" do
    it "should return the correct answer" do
      correct_answers = ["javascript_include_tag 'application'", "<%= javascript_include_tag 'application' %>", 'javascript_include_tag "application"', '<%= javascript_include_tag "application" %>']
      expect(correct_answers).to include(modern_javascript)
    end
  end

  describe "#add_a_npm_package" do
    it "should return the correct answer" do
      expect(add_a_npm_package).to eq('importmap pin sweetalert')
    end
  end
end
