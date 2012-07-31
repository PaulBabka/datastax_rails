require 'spec_helper'

describe DatastaxRails::Base do
  it "should run before_save" do
    p = Person.new(:name => "Jason")
    p.save
    p.nickname.should == "Jason"
  end
  
  it "should run after_save" do
    p = Person.new(:name => "Jason")
    p.save!
    p.instance_variable_get(:@after_save_ran).should == "yup"
  end
  
  it "should raise RecordNotFound when finding a bogus ID" do
    pending "Datastax Enterprise 2.2 should fix this" do
      lambda { Person.find("xyzzy") }.should raise_exception(DatastaxRails::RecordNotFound)
    end
  end
end
