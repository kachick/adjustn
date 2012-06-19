# adjustn
#   A tiny tool for adjusting new line characters(CR LF CRLF)

# Copyright (C) 2012 Kenichi Kamiya


module AdjustN

  VERSION = '0.0.1'.freeze

  module NewlineChar
  
    Autonyms = {
      cr: :cr,
      lf: :lf,
      crlf: :crlf,
      mac: :cr,
      unix: :lf,
      win: :crlf,
      dos: :crlf
    }.freeze

    LF = "\x0a".freeze
    CR = "\x0d".freeze
    CRLF = "\x0d\x0a".freeze

    Pair = Struct.new :before, :after
    
    PAIRS = {
      lf: Pair.new(/#{CRLF}|#{CR}/, LF).freeze,
      cr: Pair.new(/#{CRLF}|#{LF}/, CR).freeze,
      crlf: Pair.new(/(?<!#{CRLF})(?:#{LF}|#{CR})/, CRLF).freeze
    }.freeze

    class << self

      # @return [Symbol] :cr, :lf, :crlf
      def autonym(str)
        if /\A(cr|lf|crlf|mac|unix|win|dos)\z/i =~ str
          Autonyms.fetch str.downcase.to_sym
        else
          raise TypeError
        end
      end
    
    end

  end

  class << self
    
    def run(after_code, *pathnames)
      raise ArgumentError unless pathnames.length >= 1

      want = NewlineChar.autonym(after_code)
      before, after = *NewlineChar::PAIRS.fetch(want)

      pathnames.each do |pathname|
        source = File.binread pathname

        if output = source.gsub!(before){after}
          File.open pathname, 'wb' do |f|
            f << output
          end
        else
          $stderr.puts %!Already adjuted the file "#{pathname}"!
        end
      end
    end

  end

end