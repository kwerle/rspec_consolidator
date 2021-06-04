# frozen_string_literal: true

require_relative "../../spec_helper"

# "summary": {
#   "duration": 0.02296628,
#   "example_count": 4,
#   "failure_count": 1,
#   "pending_count": 2,
#   "errors_outside_of_examples_count": 0
# },
# "summary_line": "4 examples, 1 failure, 2 pending"

RSpec.describe RspecConsolidator::Summary do
  let(:json_string) { file_fixture("simple.json").read }
  let(:hash) { JSON.parse(json_string)["summary"] }

  describe "#initialize" do
    it "works with a hash" do
      summary = RspecConsolidator::Summary.new(hash)
      expect(summary).to_not be_nil
    end
  end

  describe "methods" do
    let(:summary) { RspecConsolidator::Summary.new(hash) }

    describe ".duration" do
      it "returns the value" do
        expect(summary.duration).to eq(0.02296628)
      end
    end

    describe ".example_count" do
      it "returns the value" do
        expect(summary.example_count).to eq(4)
      end
    end

    describe ".failure_count" do
      it "returns the value" do
        expect(summary.failure_count).to eq(1)
      end
    end

    describe ".pending_count" do
      it "returns the value" do
        expect(summary.pending_count).to eq(2)
      end
    end

    describe ".errors_outside_of_examples_count" do
      it "returns the value" do
        expect(summary.errors_outside_of_examples_count).to eq(0)
      end
    end
  end
end
