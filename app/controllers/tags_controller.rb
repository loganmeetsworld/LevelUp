class TagsController < ApplicationController
  before_action :find_tag, only: [:show]

  def index
    # shows all tags
    @tags = Tag.all
  end

  def show
    # show page for one tag, includes all resources with that tag
    @resources = @tag.resources
  end

  def new

  end

  def create

  end

  def destroy

  end

  def edit

  end

  def update

  end

  private

  def find_tag
    @tag = Tag.find(params[:id])
  end

end
