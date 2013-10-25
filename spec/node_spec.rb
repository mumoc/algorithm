require 'rspec'

class Node
  attr_accessor :distance, :visited, :neighbors

  def initialize
    @neighbors = []
  end
end

describe Node do
  subject { Node.new }
  describe 'attributes' do
    it 'responds to distance' do
      expect(subject).to respond_to 'distance'
    end

    it 'responds to visited' do
      expect(subject).to respond_to 'visited'
    end

    it 'responds to neighbors' do
      expect(subject).to respond_to 'neighbors'
    end
  end

  describe 'default state' do
    it 'sets visited as false' do
      expect(subject.visited).to be_false
    end

    it 'doesn\'t set any distance' do
      expect(subject.distance).to be_nil
    end

    it 'sets neighbors as an array' do
      expect(subject.neighbors).to be_instance_of(Array)
    end
  end
end
