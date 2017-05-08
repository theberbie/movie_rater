class ReviewsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :delete, :update, :edit]

	def new
	end

	def static_page
		@review = Review.new
		@latest_review = Review.order(id: :desc).limit(5)

		@reviews = Review.all
			respond_to do |format|
				format.json do
					render json: @reviews
			end
				format.html
		end
	end

	def index 
		@reviews = Review.all
			respond_to do |format|
				format.json do
					render json: @reviews
			end
				format.html
		end
	end

	def create
		@review = current_user.reviews.create(review_params)
		redirect_to root_path
	end

	def edit
		@review = Review.find_by_id(params[:id])
		return render_not_found if @review.blank?
		return render_not_found(:forbidden) if @review.user != current_user
	end

	def update
		@review = Review.find_by_id(params[:id])
		if @review.user != current_user
			return render text "Not Allowed", status: :forbidden
		end

		@review.update_attributes(review_params)
		redirect_to root_path

	end

	def destroy
		@review = Review.find_by_id(params[:id])
		if @review.user != current_user
			return render text "Not Allowed", status: :forbidden
		end
		@review.destroy
		redirect_to root_path
	end
	
	def show
		@review = Review.find_by_id(params[:id])		

		@reviews = Review.where(movie_id: params[:id])
	end


	private

	def review_params
		params.require(:review).permit(:rating, :comment, :movie_id, :movie_title)
	end
end
