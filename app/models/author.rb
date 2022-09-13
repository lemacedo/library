# frozen_string_literal: true

class Author < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :genre
  validates_presence_of :age
end
