require 'spec_helper'

RSpec.describe WeightedGraph do
  it 'has a version number' do
    expect(WeightedGraph::VERSION).not_to be nil
  end

  # Graph API
  describe WeightedGraph::Graph do
    it { is_expected.to respond_to(:add_edge).with(3).arguments }
    it { is_expected.to respond_to(:get_edge_weight).with(2).arguments }

    before do
      @graph = WeightedGraph::Graph.new
    end

    describe '.add_edge' do
      it 'adds a weighted edge to the graph' do
        @graph.add_edge('A', 'B', 12)
        expect(@graph.get_edge_weight('A', 'B')).to eq(12)
      end
      it 'can add multiple edges from a source vertex' do
        @graph.add_edge('A', 'B', 5)
        @graph.add_edge('A', 'C', 6)
        expect(@graph.get_edge_weight('A', 'B')).to eq(5)
        expect(@graph.get_edge_weight('A', 'C')).to eq(6)
      end
    end
  end
  # it 'does something useful' do
  #   expect(false).to eq(true)
  # end
end
