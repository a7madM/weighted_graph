require 'spec_helper'

# Graph API tests
module WeightedGraph
  describe Graph do
    it { is_expected.to respond_to(:add_edge).with(3).arguments }
    it { is_expected.to respond_to(:contains_edge?).with(2).arguments }
    it { is_expected.to respond_to(:get_edge_weight).with(2).arguments }

    before do
      @graph = WeightedGraph::Graph.new
    end

    describe '.add_edge' do
      it 'adds a weighted edge to the graph' do
        expect(@graph.contains_edge?('A', 'B')).to be false
        @graph.add_edge('A', 'B', 12)
        expect(@graph.contains_edge?('A', 'B')).to be true
      end
      it 'can add multiple edges from a source vertex' do
        @graph.add_edge('A', 'B', 5)
        @graph.add_edge('A', 'C', 6)
        expect(@graph.contains_edge?('A', 'B')).to be true
        expect(@graph.contains_edge?('A', 'C')).to be true
      end
    end

    describe '.get_edge_weight' do
      it 'returns weight submitted for a given edge' do
        @graph.add_edge('A', 'B', 5)
        @graph.add_edge('A', 'C', 6)
        expect(@graph.get_edge_weight('A', 'B')).to eq(5)
        expect(@graph.get_edge_weight('A', 'C')).to eq(6)
      end
      it 'returns infinity for non-edges' do
        expect(@graph.get_edge_weight('A', 'B')).to eq(Float::INFINITY)
      end
    end
  end
end
