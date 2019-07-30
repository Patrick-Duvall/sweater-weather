require 'rails_helper'

RSpec.describe City, type: :model do

  it "has attributes after create" do

    city = City.create('denver,co')
    expect(city.name).to eq('Denver')
    expect(city.state).to eq('CO')
    expect(city.query_string).to eq('denver,co')
    expect(city.lat).to eq(39.7392358)
    expect(city.lng).to eq(-104.990251)
  end

end
