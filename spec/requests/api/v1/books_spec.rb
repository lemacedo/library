# frozen_string_literal: true

require 'swagger_helper'

describe 'Books API' do
  path '/api/v1/books' do
    get 'Get all books' do
      tags 'Book'
      consumes 'application/json'

      response '200', 'books found' do
        let(:id) { Blog.create(title: 'foo', description: 'bar').id }
        run_test!
      end
    end

    post 'Creates a book' do
      tags 'Book'
      consumes 'application/json'
      parameter name: :book, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          genre: { type: :string },
          author: { type: :string },
          publication_at: { type: :string },
          publisher: { type: :string }
        },
        required: %w[title content]
      }

      response '200', 'book created' do
        let(:book) { { title: 'foo'} }

        run_test!
      end
    end
  end

  path '/api/v1/books/{id}' do
    get 'Get a book by id Book' do
      tags 'Book'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'book found' do
        schema type: :object,
               properties: {
                 id: { type: :integer }
               },
               required: [ 'id']

        let(:id) { Blog.create(title: 'foo', description: 'bar').id }
        run_test!
      end

      response '404', 'book not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
