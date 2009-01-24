require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Upload do

  it "should have a display filename that consists of only the name of the file" do
    upload = Upload.new(:filename => Upload.path(1) + "/file.zip")
    upload.stub!(:pouch).and_return(Pouch.new(:id => 1))
    upload.display_filename.should == "file.zip"
  end

end