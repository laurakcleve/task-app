class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)

    respond_to do |format|
      format.html { redirect_to edit_task_path }
      format.js
    end
  end

  private

    def tag_params
      params.require(:tag).permit(:name)
    end
end
