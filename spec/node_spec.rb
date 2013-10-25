require 'rspec'
require './node'

describe Node do
  subject { Node.new }

  describe 'default state' do
    it 'sets visited as false' do
      expect(subject.visited).to be_false
    end

    it 'doesn\'t set any distance' do
      expect(subject.distance).to be_nil
    end

    it 'sets neighbors as an array' do
      expect(subject.neighbors).to be_instance_of Array
    end

    it 'sets name as an empty string' do
      expect(subject.name).to eql('')
    end
  end

  describe '#set_as_initial' do
    let(:initial_node) { Node.new }

    before do
      initial_node.set_as_initial
    end

    it 'sets distance to 0' do
      expect(initial_node.distance).to eql 0
    end
  end

  describe '#initial?' do
    let(:node) { Node.new }

    context 'having 0 as distance' do
      before do
        node.set_as_initial
      end

      it 'returns true' do
        expect(node.initial?).to be_true
      end
    end

    context 'not having distance' do
      it 'returns false' do
        expect(node.initial?).to be_false
      end
    end
  end
end
