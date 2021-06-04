# coding: us-ascii
# frozen_string_literal: true

module AdjustN
  class << self
    # @param [Symbol, String] after_code
    # @return [void]
    def run(after_code, *pathnames)
      raise ArgumentError unless pathnames.length >= 1

      before, after = *pair_for(after_code)

      pathnames.each do |pathname|
        source = File.binread(pathname)

        if output = gsub_for!(source, before, after)
          File.open(pathname, 'wb') do |f|
            f << output
          end
        else
          $stderr.puts %Q!Already adjusted the file "#{pathname}"!
        end
      end
    end

    private

    # @return [NewlineChar::Pair]
    def pair_for(want)
      want = NewlineChar.autonym(want)
      NewlineChar::PAIRS.fetch(want)
    end

    # @return [String, nil]
    # @note for easy testing
    def gsub_for!(source, before, after)
      source.gsub!(before) { after }
    end
  end
end
