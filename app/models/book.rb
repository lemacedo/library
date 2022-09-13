# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :genre
  validates_presence_of :publication_at
  validates_presence_of :publisher
end
