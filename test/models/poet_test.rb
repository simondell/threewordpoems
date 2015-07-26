require 'test_helper'

class PoetTest < ActiveSupport::TestCase

	def setup
		@poet = Poet.new display_name: 'Poet Tester', email: 'nothing@brite.ze'
	end

	test 'should be valid' do
		assert @poet.valid?
	end

end
