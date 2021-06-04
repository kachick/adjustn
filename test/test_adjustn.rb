# coding: us-ascii

require_relative 'helper'

CR, LF, CRLF = AdjustN::NewlineChar::CR,
  AdjustN::NewlineChar::LF, AdjustN::NewlineChar::CRLF

Declare.describe do
  before, after = *AdjustN.__send__(:pair_for, :cr)
  sample = "1#{LF}2#{CR}3#{CRLF}4#{LF}#{CRLF}5#{CR}#{CRLF}6#{CRLF}#{LF}7#{CR}#{CR}8#{LF}#{LF}9#{CRLF}#{CRLF}"
  The(AdjustN.__send__ :gsub_for!, sample.dup, before, after) {
    is_a String
    is "1#{CR}2#{CR}3#{CR}4#{CR}#{CR}5#{CR}#{CR}6#{CR}#{CR}7#{CR}#{CR}8#{CR}#{CR}9#{CR}#{CR}"
  }

  before, after = *AdjustN.__send__(:pair_for, :lf)
  The(AdjustN.__send__ :gsub_for!, sample.dup, before, after) {
    is_a String
    is "1#{LF}2#{LF}3#{LF}4#{LF}#{LF}5#{LF}#{LF}6#{LF}#{LF}7#{LF}#{LF}8#{LF}#{LF}9#{LF}#{LF}"
  }

  before, after = *AdjustN.__send__(:pair_for, :crlf)
  The(AdjustN.__send__ :gsub_for!, sample.dup, before, after) {
    is_a String
    is "1#{CRLF}2#{CRLF}3#{CRLF}4#{CRLF}#{CRLF}5#{CRLF}#{CRLF}6#{CRLF}#{CRLF}7#{CRLF}#{CRLF}8#{CRLF}#{CRLF}9#{CRLF}#{CRLF}"
  }
end
