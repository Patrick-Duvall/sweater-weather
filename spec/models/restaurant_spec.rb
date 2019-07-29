require "rails_helper"

describe "restaurant" do
  it "attributes" do
    info = {"id"=>"M4MwxQAA58B7ENV8ootI-w",
  "alias"=>"kans-kitchen-pueblo",
  "name"=>"Kan's Kitchen",
  "image_url"=>"https://s3-media3.fl.yelpcdn.com/bphoto/ZZVNpsvc_x6p5iY8CCpzUg/o.jpg",
  "is_closed"=>false,
  "url"=>
   "https://www.yelp.com/biz/kans-kitchen-pueblo?adjust_creative=ZSs8e0-ITwLGvPXI-_Ky7w&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=ZSs8e0-ITwLGvPXI-_Ky7w",
  "review_count"=>17,
  "categories"=>[{"alias"=>"chinese", "title"=>"Chinese"}, {"alias"=>"hotdogs", "title"=>"Fast Food"}],
  "rating"=>4.0,
  "coordinates"=>{"latitude"=>38.2401504516602, "longitude"=>-104.643249511719},
  "transactions"=>[],
  "price"=>"$",
  "location"=>
   {"address1"=>"1620 S Prairie Ave",
    "address2"=>nil,
    "address3"=>nil,
    "city"=>"Pueblo",
    "zip_code"=>"81005",
    "country"=>"US",
    "state"=>"CO",
    "display_address"=>["1620 S Prairie Ave", "Pueblo, CO 81005"]},
  "phone"=>"+17195660209",
  "display_phone"=>"(719) 566-0209",
  "distance"=>6971.117622629485}
  restaurant = Restaurant.new(info)
  expect(restaurant.name).to eq("Kan's Kitchen")
  expect(restaurant.address).to eq("1620 S Prairie Ave, Pueblo, CO 81005")

  end

end
