# frozen_string_literal: true

module Api
  module V1
    # BooksController
    class BooksController < ApplicationController
      before_action :set_book, only: [:show, :update, :destroy]

      def index
        books = Book.all

        render json: books
      end

      def create
        book = Book.create(permit_params)

        render json: book
      end

      def show
        if @book.present?
          render json: @book
        else
          render json: { message:'Book not found' }, status: :not_found
        end
      end

      def update
        @book.update(permit_params)

        book_updated = Book.find(params[:id])

        render json: book_updated
      end

      def destroy
        @book.destroy

        render json: { message:'Book delete with success!' }, status: :ok
      end

      private

      def permit_params
        params.permit(:title, :description, :genre, :author, :publication_at, :publisher)
      end

      def set_book
        @book = Book.where(id: params[:id])
      end
    end
  end
end
