require "spec_helper"

RSpec.describe "Basic component" do
  class BasicComponent < RailsReactComponents::Component
    prop :name

    prop :email, on: :user
    prop :nick, delegate: :user # alias

    prop :is_ready, include_blank: false

    def name
      "Franek Kimono"
    end

    def is_ready
      ready? ? "yes" : ""
    end

    def ready?
      true
    end
  end

  describe "#props" do
    it "returns initialized props hash" do
      component = BasicComponent.new(user: user)
      expect(component.props).to eq(
        {
          name: "Franek Kimono",
          email: "user@example.com",
          nick: "Rocky",
          is_ready: "yes"
        }
      )
    end

    context "when prop with include_blank is blank" do
      it "does not return it in props" do
        component = BasicComponent.new(user: user)
        allow(component).to receive(:ready?) { false }
        expect(component.props).to_not have_key(:is_ready)
      end
    end
  end

  describe "#component" do
    it "returns class name" do
      component = BasicComponent.new(user: user)
      expect(component.component).to eq "BasicComponent"
    end
  end

  def user
    @user ||= double(:user, email: "user@example.com", nick: "Rocky")
  end
end
