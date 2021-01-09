module Api
  module V1
    class IdeasController < ApplicationController
      def index
        category_name = params[:category_name]
        ideas = Category.joins(:ideas).select('categories.name AS category, ideas.*')
        if category_name.nil?
          render json: { data: ideas.as_json(only: %i[id category body]) }, status: :ok
        else
          #TODO
          selected_ideas = ideas.where("categories.name = ?", category_name)
          render json: { data: selected_ideas.as_json(only: %i[id category body]) }, status: :ok
        end
      end
    end
  end
end
