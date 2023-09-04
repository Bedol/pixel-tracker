class Open < ApplicationRecord
  belongs_to :link

  enum source: {
    email: 0,
    other: 11
  }
end
