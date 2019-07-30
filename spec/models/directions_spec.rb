require 'rails_helper'

RSpec.describe DirectionsTime, type: :model do
   describe "attributes" do
     it "attributes" do
       info = {"routes"=>
        [{"bounds"=>
           {"northeast"=>{"lat"=>39.7420834, "lng"=>-104.6040754}, "southwest"=>{"lat"=>38.2542053, "lng"=>-105.0158571}},
          "copyrights"=>"Map data ©2019",
          "legs"=>
           [{"distance"=>{"text"=>"114 mi", "value"=>184172},
             "duration"=>{"text"=>"1 hour 47 mins", "value"=>6413},
             "end_address"=>"Pueblo, CO, USA",
             "end_location"=>{"lat"=>38.2542053, "lng"=>-104.6087488},
             "start_address"=>"Denver, CO, USA",
             "start_location"=>{"lat"=>39.7411598, "lng"=>-104.9879112}
           }]
         }]
       }
       directions = DirectionsTime.new(info)
       expect(directions.seconds).to eq(6413)
       expect(directions.time_string).to eq("1 hour 47 mins")

     end

   end
end
