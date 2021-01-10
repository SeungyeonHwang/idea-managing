module Api
  module V1
    class IdeasController < ApplicationController
      def index
        category_name = params[:category_name]
        if category_name.nil?
          ideas = Category.joins(:ideas).select('categories.name AS category, ideas.*')
          render json: { data: ideas.as_json(only: %i[id category body]) }, status: :ok
        else
          selected_ideas = Category.joins(:ideas).select('categories.*, ideas.*').where('categories.name = ?', category_name)
          render json: { data: selected_ideas.as_json(only: %i[id body]) }, status: :ok
        end
      end
    end
  end
end
