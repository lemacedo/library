# frozen_string_literal: true

require 'swagger_helper'

describe 'Books API' do
  path '/books' do
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

      response '201', 'book created' do
        let(:book) { { title: 'foo', content: 'bar' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:book) { { title: 'foo' } }
        run_test!
      end
    end
  end

  path '/books' do
    get 'Retrieves all books' do
      tags 'Books'
      produces 'application/json', 'application/xml'

      response '200', 'books found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 description: { type: :string },
                 genre: { type: :string },
                 author: { type: :string },
                 publication_at: { type: :string },
                 publisher: { type: :string }
               }

        let(:books) { Book.create(title: 'foo', content: 'bar').id }
        run_test!
      end
    end
  end

  path '/books/{id}' do
    get 'Retrieves a book' do
      tags 'Books'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'book found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 description: { type: :string },
                 genre: { type: :string },
                 author: { type: :string },
                 publication_at: { type: :string },
                 publisher: { type: :string }
               },
               required: %w[id title content]

        let(:id) { Book.create(title: 'foo', content: 'bar').id }
        run_test!
      end

      response '404', 'book not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end
end
