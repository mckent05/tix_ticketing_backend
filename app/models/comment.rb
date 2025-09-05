# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :ticket
  belongs_to :user

  validates :content, presence: true

  after_save :update_ticket


  private

  def update_ticket
    return unless user.agent?

    ticket.update!(
      agent_id: ticket.agent_id || user.id, # assign only if not already assigned
      status: 'in_progress' # always set status to in_progress on agent comment
    )
  end
end
