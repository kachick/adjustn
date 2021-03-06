# coding: us-ascii
# frozen_string_literal: true

# Copyright (C) 2012 Kenichi Kamiya

module AdjustN
  module NewlineChar
    AUTONYMS = {
      cr: :cr,
      lf: :lf,
      crlf: :crlf,
      mac: :cr,
      unix: :lf,
      win: :crlf,
      dos: :crlf
    }.freeze

    LF = "\x0a"
    CR = "\x0d"
    CRLF = (CR + LF)

    Pair = Struct.new(:before, :after)

    PAIRS = {
      lf: Pair.new(/#{CRLF}|#{CR}/, LF).freeze,
      cr: Pair.new(/#{CRLF}|#{LF}/, CR).freeze,
      crlf: Pair.new(/(?<!#{CR})#{LF}|#{CR}(?!#{LF})/, CRLF).freeze
    }.freeze

    class << self
      # @param [String] str
      # @return [Symbol] :cr, :lf, :crlf
      def autonym(str)
        if /\A(cr|lf|crlf|mac|unix|win|dos)\z/i.match?(str)
          AUTONYMS.fetch(str.downcase.to_sym)
        else
          raise TypeError
        end
      end
    end
  end
end
