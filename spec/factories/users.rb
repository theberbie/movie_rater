FactoryGirl.define do 
	factory :user do
		sequence :email do |n|
			"useremail#{n}@example.com"
		end

		password "secretPassword"
		password_confirmation "secretPassword"
	end

end