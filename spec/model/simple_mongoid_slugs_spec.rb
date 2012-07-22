require 'spec_helper'

class DummyModel
  include Mongoid::Document
  include SimpleMongoidSlugs

  #should contain name to generate slug
  field :name, type: String 
end

describe DummyModel do
  before(:each) do
    DummyModel.destroy_all
    @dummy_model = DummyModel.create!(name: "bla&bla")
  end

  it "should have slug" do
    @dummy_model.slug.should eq("bla-and-bla")
  end

  it "should have unique slug" do
    DummyModel.create!(name: "bla&bla").slug.should eq("bla-and-bla-")
    DummyModel.create!(name: "bla&bla").slug.should eq("bla-and-bla--")
    DummyModel.create!(name: "bla&bla").slug.should eq("bla-and-bla---")
  end

  it "should not have empty slug" do
    DummyModel.create!(name: "'''").slug.should eq("-")
  end

  it "should return slug via to_param" do
    @dummy_model.to_param.should eq("bla-and-bla")
  end

  it "should find by slug" do
    DummyModel.find_by_slug(@dummy_model.slug).should eq(@dummy_model)
  end

  describe String do
    it "contain numbers and symbols" do
      "bla11".to_slug.should eq "bla11"
    end

    it "should convert @ symbol" do
      "bla@bla".to_slug.should eq "bla-at-bla"
    end

    it "should convert & symbol" do
      "bla&bla".to_slug.should eq "bla-and-bla"
    end

    it "should skip quotes" do
      "'`bla&bla`'".to_slug.should eq "bla-and-bla"
    end
  end

end