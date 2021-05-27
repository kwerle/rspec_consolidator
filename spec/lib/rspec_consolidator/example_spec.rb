# frozen_string_literal: true

require_relative "../../spec_helper"
require "json"

# {
#   "id": "./spec/rspec_consolidator_spec.rb[1:2]",
#   "description": "does something useful",
#   "full_description": "RspecConsolidator does something useful",
#   "status": "failed",
#   "file_path": "./spec/rspec_consolidator_spec.rb",
#   "line_number": 9,
#   "run_time": 0.000440578,
#   "pending_message": null,
#   "exception": {
#     "class": "RSpec::Expectations::ExpectationNotMetError",
#     "message": "\nexpected: true\n     got: false\n\n(compared using ==)\n\nDiff:\n@@ -1 +1 @@\n-true\n+false\n",
#     "backtrace": [
#       "/usr/local/bundle/gems/rspec-support-3.10.2/lib/rspec/support.rb:102:in `block in <module:Support>'",
# ...

RSpec.describe RspecConsolidator::Example do
  let(:json_string) { file_fixture("simple.json").read }
  let(:hash) { JSON.parse(json_string)["examples"].first }

  describe "#initialize" do
    it "works with a hash" do
      example = RspecConsolidator::Example.new(hash)
      expect(example).to_not be_nil
    end
  end

  describe "methods" do
    let(:example) { RspecConsolidator::Example.new(hash) }

    describe ".id" do
      it "returns the id" do
        expect(example.id).to eq("./spec/rspec_consolidator_spec.rb[1:1]")
      end
    end

    describe ".description" do
      it "returns the description" do
        expect(example.description).to eq("has a version number")
      end
    end

    describe ".full_description" do
      it "returns the full_description" do
        expect(example.full_description).to eq("RspecConsolidator has a version number")
      end
    end

    describe ".status" do
      it "returns the status" do
        expect(example.status).to eq("pending")
      end
    end

    describe ".file_path" do
      it "returns the file_path" do
        expect(example.file_path).to eq("./spec/rspec_consolidator_spec.rb")
      end
    end

    describe ".line_number" do
      it "returns the line_number" do
        expect(example.line_number).to eq(4)
      end
    end

    describe ".run_time" do
      it "returns the run_time" do
        expect(example.run_time).to eq(0.020361127)
      end
    end

    describe ".pending_message" do
      it "returns the pending_message" do
        expect(example.pending_message).to eq("because")
      end
    end

    describe ".pending?" do
      it "returns true if it's pending" do
        expect(example.pending?).to be_truthy
        example.instance_variable_set("@hash", { "status" => "passed" })
        expect(example.pending?).to be_falsey
      end
    end

    describe ".failed?" do
      it "returns true if it failed" do
        expect(example.failed?).to be_falsey
        example.instance_variable_set("@hash", { "status" => "failed" })
        expect(example.failed?).to be_truthy
      end
    end

    describe ".passed?" do
      it "returns true if it passed" do
        expect(example.passed?).to be_falsey
        example.instance_variable_set("@hash", { "status" => "passed" })
        expect(example.passed?).to be_truthy
      end
    end
  end
end
