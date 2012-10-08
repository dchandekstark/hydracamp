require 'spec_helper'

describe "Zombies" do
  describe "GET /zombies" do
    it "should create a zombie" do
      visit new_zombie_path
      #response.status.should be(200)
      fill_in "Name", :with => "Ash"
      fill_in "Graveyard", :with => "Duke Memorial"
      click_button "Create"
      page.should have_content "Added Zombie"
      page.should have_content "Ash"
      page.should have_content "Duke Memorial"
    end
  end
end
