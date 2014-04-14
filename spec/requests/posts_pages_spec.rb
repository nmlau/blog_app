#mostly based on posts scaffolding

require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "post pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user, :scope => :user)
    visit root_path
  end

  it { should have_link('Sign out',    href: destroy_user_session_path) }


  Warden.test_reset! 
end