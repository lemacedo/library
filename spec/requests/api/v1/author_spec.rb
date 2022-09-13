# frozen_string_literal: true

require 'swagger_helper'
require 'swagger_helper'

RSpec.describe "Api::V1::Authors", type: :request do

  describe 'Author API' do
    path '/api/v1/author' do
      get 'Get all author' do
        tags 'Author'
        consumes 'application/json'

        response '200', 'author found' do
          let(:id) { Book.create(name: 'foo', genre: 'bar', 'age': '67').id }
          run_test!
        end
      end

      post 'Creates a author' do
        tags 'Author'
        consumes 'application/json'
        parameter name: :author, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string, default: "Shakespeare" },
            genre: { type: :string, default: "drama" },
            age: { type: :string, default: "60"  }
          },
          required: %w[title content]
        }

        response '200', 'author created' do
          let(:author) { { title: 'foo'} }

          run_test!
        end
      end
    end

    path '/api/v1/author/{id}' do
      get 'Get a author by id Author' do
        tags 'Author'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :string

        response '200', 'author found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer }
                 },
                 required: [ 'id']

          let(:id) { Book.create(title: 'foo', description: 'bar').id }
          run_test!
        end

        response '404', 'author not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    path '/api/v1/author/{id}' do
      put 'Update a author by id Author' do
        tags 'Author'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :string

        response '200', 'author found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer }
                 },
                 required: [ 'id']

          let(:id) { Book.create(title: 'foo', description: 'bar').id }
          run_test!
        end

        response '404', 'author not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    path '/api/v1/author/{id}' do
      delete 'Delete a author by id Author' do
        tags 'Author'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :string

        response '200', 'author found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer }
                 },
                 required: [ 'id']

          let(:id) { Book.create(title: 'foo', description: 'bar').id }
          run_test!
        end

        response '404', 'author not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end
  end
end
