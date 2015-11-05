require 'test_helper'

class PoetsSignupTest < ActionDispatch::IntegrationTest
	INVALID_POET = {
		name: '',
		email: 'user@invalid',
		password: 'foo',
		password_confirmation: 'bar'
	}

	VALID_POET = {
		name: 'Valid Poet Name',
		email: 'valid_poet@val.id',
		password: 'foobar',
		password_confirmation: 'foobar'
	}


	test 'failing new poet submission returns user to new poet page' do
		post poets_path, poet: INVALID_POET

		assert_template 'poets/new'
	end

	test 'no poets created for invalid submission' do
		assert_no_difference 'Poet.count' do
			post poets_path, poet: INVALID_POET
		end
	end



	test 'valid poet submission creates new poet' do
		assert_difference 'Poet.count', 1 do
			post poets_path, poet: VALID_POET
		end
		assert_template 'poets/show'
	end
	# test 'successful new poet subission redirects to poet#show' do
	# 	post poets_path, poet: VALID_POET

	# end

end
