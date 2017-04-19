#!/usr/bin/env ruby
require_relative 'lib/account_manager'

while line=gets
	line_items = line.split
	AccountManager.process(line_items)
end

AccountManager.display_summary 	

