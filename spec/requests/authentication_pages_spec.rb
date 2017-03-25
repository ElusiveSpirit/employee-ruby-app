require 'rails_helper'

RSpec.describe "AuthenticationPages", type: :request do
  subject { page }

  describe "Sign up page" do
    before { visit "/signup" }

    let(:submit) { "Sign up" }

    describe "With invalid data" do
      it 'should not create a user' do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_title('Sign up') }
        it { should have_content('error') }
      end
    end

    describe "With valid data" do
      before do
        fill_in "Email", with: "text@example.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
      end

      it 'should create a user' do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  describe "Login page" do
    before { visit "/login" }

    it { should have_content("Login") }

    describe "with invalid information" do
      before { click_button "Log in" }

      it { should have_title('Log in') }
      it { should have_selector('div.alert.alert-error') }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Log in"
      end

      it { should have_title(user.email) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Log out',    href: logout_path) }
      it { should_not have_link('Log in', href: login_path) }
    end
  end

  describe "Logout page" do

  end
end
