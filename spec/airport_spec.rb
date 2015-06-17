require 'airport'
require 'plane'

describe Airport do
  let(:plane) { double :plane, landed: nil, flying: nil } # refactor objects that you need for each test to 'let' blocks,

   it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it {is_expected.to respond_to :check_the_weather}


  describe 'instruct_plane' do
    it { is_expected.to respond_to :instruct_plane }
  end

  describe 'release_plane' do

    before(:each) do # use before blocks to dry out repeated stubbing of methods
      allow(subject).to receive(:check_the_weather) { true }
    end

    it { is_expected.to respond_to :release_plane }

    it "reise an error when it's empty" do
      expect {subject.release_plane plane}.to raise_error "\n\n*****   Airport is empty   *****\n\n".upcase
    end

    it 'release a plane if sunny' do
      subject.landing(plane)
      expect(subject.release_plane(plane)).to eq plane # this test was failing before because the #release_plane method was returning the return value of plane.flying, rather than a plane
    end

    it "raise a error if it's stormy" do
      subject.landing(plane)
      allow(subject).to receive(:check_the_weather) {false}
      expect { subject.release_plane plane}.to raise_error "\n\n*****   WARNING!! It's stormy, plane is not authorized to take off  *****\n\n".upcase
    end
  end

  describe 'landing' do

    it {is_expected.to respond_to :landing}

    it 'raises an error when full' do
      allow(subject).to receive(:check_the_weather) { true }
      subject.capacity.times { subject.landing plane }
      expect { subject.landing plane }.to raise_error "\n\n*****   Airport is full   *****\n\n".upcase
    end

    it "raises an error when it's stormy" do
      allow(subject).to receive(:check_the_weather) { false }
      expect { subject.landing plane }.to raise_error "\n\n*****   WARNING!! It's stormy, plane is not authorized to landing  *****\n\n".upcase
    end

    it "a plane cal land if it's sunny" do
      allow(subject).to receive(:check_the_weather) { true }
      expect { subject.landing plane }.not_to raise_error # use not_to raise_error to check that when it's sunny, landing a plane doesn't raise an error
    end
  end
end
