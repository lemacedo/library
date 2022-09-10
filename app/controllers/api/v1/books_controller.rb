class Api::V1::BooksController < ApplicationController
  def index
    books = Book.all

    render json: books
  end

  def create
    book = Book.create(permit_params)

    render json: book
  end

  def show
    book = Book.find(params[:id])

    render json: book
  end

  def update
    book = Book.find(params[:id])
    book.update(permit_params)

    book_updated = Book.find(params[:id])

    render json: book_updated
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
  end

  private

  def permit_params
    params.require(:book).permit(:title, :description, :genre, :author, :publication_at, :publisher)
  end
end
