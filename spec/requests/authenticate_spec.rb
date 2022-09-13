# frozen_string_literal: true

require 'swagger_helper'
require 'swagger_helper'

RSpec.describe "Authenticate", type: :request do

  describe 'Authenticate' do
    path '/authenticate' do
      post 'Authenticate' do
        tags 'Auth'

        consumes 'application/json'
        parameter name: :author, in: :body, schema: {
          type: :object,
          properties: {
            email: { type: :string, default: "teste@teste.com" },
            password: { type: :string, default: "abc123" }
          },
          required: %w[email password]
        }

        response '200', 'author created' do
          let(:author) { { title: 'foo'} }

          run_test!
        end
      end
    end
  end
end
