# frozen_string_literal: true

class Api::V1::AuthorController < ApplicationController
  before_action :set_author, only: [:update, :show, :destroy]

  def index
    authors = Author.all.where('name LIKE :search OR genre LIKE :search OR age LIKE :search', search: "%#{permit_params[:q]}%")

    render json: authors
  end

  def create
    author = Author.new(permit_params)

    if author.save
      render json: { author: author }, status: :created
    else
      render json: { error: author.errors}, status: :unprocessable_entity
    end
  end

  def show
    if @author.present?
      render json: @author
    else
      render json: { message: "Author not found" }, status: not_found
    end
  end

  def update
    if @author.update(permit_params)
      author_updated = Author.where(id: params[:id])

      render json: author_updated
    else
      render json: { message: "Error update Author" }, status: :unprocessable_entity
    end
  end

  def destroy
    @author.destroy

    render json: { message: "Author delete with success" }
  end

  private

  def permit_params
    params.permit(:name, :genre, :age, :q)
  end

  def set_author
    @author = Author.where(id: params[:id])
  end
end
