class Api::V1::BooksController < ApplicationController
  def index
    render json: {'ok': 'ok'}

  end
end
