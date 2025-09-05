# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :agent, class_name: 'User', optional: true
  has_many :comments, dependent: :destroy

  enum status: { open: 0, in_progress: 1, closed: 2 }

  validates :title, :complaint, presence: true
end
