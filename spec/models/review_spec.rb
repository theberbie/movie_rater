require 'rails_helper'

RSpec.describe Review, type: :model do
	describe Review do 
		it {is_expected.to validate_presence_of(:rating)}
		it {should belong_to(:user)}
	end
end
