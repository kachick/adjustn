#!/usr/bin/env ruby
# coding: us-ascii
# frozen_string_literal: true
# adjustn
#   A tiny tool for adjusting new line characters(CR LF CRLF)

# Copyright (C) 2012 Kenichi Kamiya

require_relative '../lib/adjustn'

unless ARGV.length >= 2
  abort "Usage: #{$PROGRAM_NAME} {cr|lf|crlf} *pathnames"
end

AdjustN.run(ARGV.shift, *ARGV)
