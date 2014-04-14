require 'spec_helper'

describe "Static pages" do

  subject { page }

  before { visit root_path }

  it { should have_title('Nicks Dev Spot') }
  it { should have_content('Copyright') }
  it { should have_content('Contact') }

  describe "Home/BLog page" do
    before { visit root_path }

    it { should have_content('Recent Posts')}
    it { should have_content('Projects')}
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About Me') }
    # it { should have_css('img', text: "headshot.ico") }
  end

  describe "archive" do
    before { visit archive_path }

    it { should have_content('Archive') }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_selector('h1', text: "About Me")
    click_link "Archive"
    expect(page).to have_selector('h1', text: "Archive")
    click_link "Nicks Dev Spot"
    expect(page).to have_content('Recent Posts')
  end
end
