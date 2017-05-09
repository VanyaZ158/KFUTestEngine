module V1
  class MaterialsController < ApplicationController
    before_action :check_authorized, only: %i[create]
    before_action :find_topic_by_id

    def index
      @materials = Material.page params[:page]
      render "index"
    end

    def create
      authorize Material

      @material = @topic.materials.new(material_params)
      if @material.save
        render 'create'
      else
        render 'create', status: :bad_request
      end
    end

    private

    def material_params
      params.require(:material).permit(:short_description, :text_in_markdown)
    end

    def find_topic_by_id
      @topic = Topic.find_by!(id: params[:topic_id]) if params[:topic_id].present?
    end
  end
end
