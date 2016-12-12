class Editorial::PoemsController < ApplicationController
  before_action :has_editor_rights, only: [:index, :update]

  def index
    @unmoderated = Poem.unmoderated.paginate page: params[:page], per_page: 8
  end

  def update
    poem = Poem.find_by id: params[:id]
    poem.update publish: params[:publish]
    poem.update moderated: true
    redirect_to editorial_poems_path
  end

private
  def has_editor_rights
    redirect_to root_url unless logged_in? && current_poet.editor?
  end

  def poem_params
    required = params.require :poem
    required.permit [
      :id,
      :publish
    ]
  end
end
