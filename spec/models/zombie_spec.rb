require 'spec_helper'

describe Zombie do
  it "should have a name" do
    subject.name = "Ash"
    subject.name.should == "Ash"
  end
  
  it "should have a graveyard" do
    subject.graveyard = "Duke Memorial"
    subject.graveyard.should == "Duke Memorial"
  end
  
  it "should validate that the name is present" do
    subject.should_not be_valid
    subject.errors[:name].first.should == "can't be blank"
    subject.name = "Ash"
    subject.should be_valid
  end
  
  it "should validate that the name is unique" do
    subject.name = "Ash"
    subject.save!
    bad_zombie = Zombie.new(:name => "Ash")
    bad_zombie.should_not be_valid
    bad_zombie.errors[:name].first.should == "has already been taken"
    bad_zombie.name = "Dudley"
    bad_zombie.should be_valid
  end
end
