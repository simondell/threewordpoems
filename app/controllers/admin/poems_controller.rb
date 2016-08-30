class Admin::PoemsController < ApplicationController
  before_action :has_editor_rights, only: [:index, :update]

  def index
    @unpublished = Poem.unpublished.all
    @published = Poem.published.all
  end

  def update
  end

private
  def has_editor_rights
    redirect_to root_url unless logged_in? && current_poet.editor?
  end
end
