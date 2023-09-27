# frozen_string_literal: true

# Open entity model
class Open < ApplicationRecord
  belongs_to :link

  enum source: {
    email: 0,
    other: 11
  }

  enum open_type: {
    standard: 0,
    glanced: 1,
    skimmed: 2,
    readed: 3
  }
end
