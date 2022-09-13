# frozen_string_literal: true

require 'swagger_helper'
require 'swagger_helper'

RSpec.describe "Api::V1::Books", type: :request do
  describe 'Books API' do
    path '/api/v1/books' do
      get 'Get all books' do
        tags 'Book'
        consumes 'application/json'

        response '200', 'books found' do
          let(:id) { Book.create(title: 'foo', description: 'bar').id }
          run_test!
        end
      end

      post 'Creates a book' do
        tags 'Book'
        consumes 'application/json'
        parameter name: :book, in: :body, schema: {
          type: :object,
          properties: {
            title: { type: :string, default: "Homlet" },
            description: { type: :string, default: "Written by William Shakespeare sometime between 1599 and 1601" },
            genre: { type: :string, default: "drama" },
            author_id: { type: :string, default: 1 },
            publication_at: { type: :string, default: "1890-08-02" },
            publisher: { type: :string, default: "xpto" }
          },
          required: %w[title content]
        }

        response '200', 'book created' do
          let(:book) { { title: 'foo'} }

          run_test!
        end
      end
    end

    path '/api/v1/books?page=1&per_page=10' do
      get 'Get all books with pagination' do
        tags 'Book'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :string

        response '200', 'book found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer }
                 },
                 required: [ 'id']

          let(:id) { Book.create(title: 'foo', description: 'bar').id }
          run_test!
        end

        response '404', 'book not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    path '/api/v1/books/{id}' do
      get 'Book attribute search' do
        tags 'Book'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :string

        response '200', 'book found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer }
                 },
                 required: [ 'id']

          let(:id) { Book.create(title: 'foo', description: 'bar').id }
          run_test!
        end

        response '404', 'book not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    path '/api/v1/books/{id}' do
      put 'Update a book by id Book' do
        tags 'Book'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :string

        response '200', 'book found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer }
                 },
                 required: [ 'id']

          let(:id) { Book.create(title: 'foo', description: 'bar').id }
          run_test!
        end

        response '404', 'book not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    path '/api/v1/books/{id}' do
      delete 'Delete a book by id Book' do
        tags 'Book'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :string

        response '200', 'book found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer }
                 },
                 required: [ 'id']

          let(:id) { Book.create(title: 'foo', description: 'bar').id }
          run_test!
        end

        response '404', 'book not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end
  end
end
