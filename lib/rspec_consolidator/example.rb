# frozen_string_literal: true

module RspecConsolidator
  # Hold the details for a single example
  class Example
    def initialize(hash)
      @hash = hash || {}
    end

    def id
      @hash["id"]
    end

    def description
      @hash["description"]
    end

    def full_description
      @hash["full_description"]
    end

    def status
      @hash["status"]
    end

    def file_path
      @hash["file_path"]
    end

    def line_number
      @hash["line_number"]
    end

    def run_time
      @hash["run_time"]
    end

    def pending_message
      @hash["pending_message"]
    end

    def pending?
      @hash["status"] == "pending"
    end

    def failed?
      @hash["status"] == "failed"
    end

    def passed?
      @hash["status"] == "passed"
    end
  end
end
