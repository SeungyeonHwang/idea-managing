module Api
  module V1
    class CategoriesController < ApplicationController
      def create
        category = Category.new(category_params)
        idea = category.ideas.build(idea_params)
        if category.save
          if idea.save
            render json: { status: 'SUCCESS', message: 'Saved Category', data: category }, status: :created
          else
            render json: { status: 'ERROR', message: 'Category not Saved', data: category.errors }, status: :unprocessable_entity
          end
        else
          category_name = Category.where(name: params[:category_name])
          if category_name.exists?
            idea = Idea.create(category_id: category_name.ids[0], body: params[:body])
            if idea.present?
              render json: { status: 'SUCCESS', message: 'Saved Idea', data: idea }, status: :created
            else
              render json: { status: 'ERROR', message: 'Idea not Saved', data: idea.errors }, status: :unprocessable_entity
            end
          end
        end
      end

      private

      def idea_params
        params.permit(
          :body
        )
      end

      def category_params
        params.permit(
          :category_name
        )
      end
    end
  end
end
