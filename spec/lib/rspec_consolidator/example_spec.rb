# frozen_string_literal: true

require "json"

RSpec.describe RspecConsolidator::Example do
  let(:json_string) { file_fixture("simple.json").read }
  let(:hash) { JSON.parse(json_string) }

  describe "#initialize" do
    it "works with a hash" do
      example = RspecConsolidator::Example.new(hash)
    end
  end
end
