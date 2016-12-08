class Admin::PoemsController < ApplicationController
  before_action :has_editor_rights, only: [:index, :update]

  def index
    @unpublished = Poem.unpublished.paginate page: params[:page], per_page: 8
    # @published = Poem.published.paginate page: params[:page], per_page: 8
  end

  def update
  end

private
  def has_editor_rights
    redirect_to root_url unless logged_in? && current_poet.editor?
  end
end
