require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
	describe "review#index" do
		before {get :index}
		it {should respond_with :success}
	end

	describe "review#create" do
		context "When users aren't signed in" do
			subject(:create) {post :create, review: {rating: "1_star"}}
				it {should redirect_to(new_user_session_path)}
			end
		
		context "when signed in users create a review"do
			before(:each) do
				user = FactoryGirl.create(:user)
				review = FactoryGirl.create(:review)
				sign_in user
			end
			subject(:create) {post :create, review:{rating: "1_star"}}
				it "saves the new review in the database" do
					expect{create}.to change{Review.count}.by(1)
				end

				it("redirects") {expect(create).to redirect_to root_path}
			end
		end

	describe "review#edit" do
		context "when unauthicated users edits a review" do
		before(:each) do
			@review = FactoryGirl.create(:review)
		end
		subject(:edit) {get :edit, id: @review.id}
		 it {should redirect_to(new_user_session_path)}
	end

		context "When authenticated user edits a review" do
			before(:each) do
				@review = FactoryGirl.create(:review)
				@user = FactoryGirl.create(:user)
				get :edit, id: @review.id, user: @user
			end
			
			it {should respond_with :success}
		end
end

	
end



