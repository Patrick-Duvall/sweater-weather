

  require "rails_helper"

  describe Image do
    it "attributes" do
      info = {"id"=>"35679602912",
        "owner"=>"54515111@N00",
        "secret"=>"3015493383",
        "server"=>"65535",
        "farm"=>66,
        "title"=>"Civic Center Park - Denver, Colorado",
        "ispublic"=>1,
        "isfriend"=>0,
        "isfamily"=>0}
        image = Image.new(info)
        expect(image.address).to eq("https://farm66.staticflickr.com/65535/35679602912_3015493383.jpg")
        expect(image.alt).to eq("Civic Center Park - Denver, Colorado")
        expect(image.id).to eq(35679602912)
    end

  end
