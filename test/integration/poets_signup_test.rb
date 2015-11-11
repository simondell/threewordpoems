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

	# fail-path tests
	test 'failing new poet submission returns user to new poet page' do
		post poets_path, poet: INVALID_POET

		assert_template 'poets/new'
	end

	test 'no poets created for invalid submission' do
		assert_no_difference 'Poet.count' do
			post poets_path, poet: INVALID_POET
		end
	end

	test 'invalid name field provides appropriate feedback after submission' do
		poet_with_invalid_name = VALID_POET.dup
		poet_with_invalid_name[:name] = ''

		post poets_path, poet: poet_with_invalid_name

		assert_select 'div.field_with_errors #poet_name'
	end

	test 'invalid email field provides appropriate feedback after submission' do
		poet_with_invalid_email = VALID_POET.dup
		poet_with_invalid_email[:email] = ''

		post poets_path, poet: poet_with_invalid_email

		assert_select 'div.field_with_errors #poet_email'
	end

	test 'invalid password field provides appropriate feedback after submission' do
		poet_with_invalid_password = VALID_POET.dup
		poet_with_invalid_password[:password] = ''

		post poets_path, poet: poet_with_invalid_password

		assert_select 'div.field_with_errors #poet_password'
	end

	test 'invalid password_conf field provides appropriate feedback after submission' do
		poet_with_invalid_password_conf = VALID_POET.dup
		poet_with_invalid_password_conf[:password_confirmation] = ''

		post poets_path, poet: poet_with_invalid_password_conf

		assert_select 'div.field_with_errors #poet_password_confirmation'
	end



	# success-path tests
	test 'valid poet submission creates new poet and redirects to poet#show' do
		assert_difference 'Poet.count', 1 do
			post_via_redirect poets_path, poet: VALID_POET
		end
		assert_template 'poets/show'
	end

	test 'valid poet submition generates a flash message in the resulting page' do
		post_via_redirect poets_path, poet: VALID_POET

		assert_select '[role="banner"] p'
	end
end
