require 'plane'

describe Plane do

  describe '#landed' do

    it "check if is landed" do
      plane = Plane.new # refactor this with a let block, as we did in airport_spec
      plane.landed
      expect(plane).not_to be_flying
    end
  end

  describe '#flying' do
    it {is_expected.to respond_to :flying}

    it "check if is flying" do
      plane = Plane.new # refactor to let block
      plane.flying
      expect(plane).to be_flying
    end
  end
end
