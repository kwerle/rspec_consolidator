# frozen_string_literal: true

module RspecConsolidator
  # Hold the details for a summary.  And also support adding another summary's values.
  class Summary
    def initialize(hash)
      @hash = hash || {}
    end

    def duration
      @hash["duration"]
    end

    def example_count
      @hash["example_count"]
    end

    def failure_count
      @hash["failure_count"]
    end

    def pending_count
      @hash["pending_count"]
    end

    def errors_outside_of_examples_count
      @hash["errors_outside_of_examples_count"]
    end
  end
end
