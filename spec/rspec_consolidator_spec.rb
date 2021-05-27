# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe RspecConsolidator do
  it "has a version number" do
    expect(RspecConsolidator::VERSION).to_not be_nil
  end
end
