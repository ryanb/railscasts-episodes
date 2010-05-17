require File.dirname(__FILE__) + '/lib/abingo'

ActionController::Base.send :include, AbingoSugar

ActionView::Base.send :include, AbingoViewHelper