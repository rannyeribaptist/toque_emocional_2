class School < ApplicationRecord
  validates_presence_of :name, :color, required: true

  has_one :user, dependent: :destroy

  has_trash
  default_scope {where(arel_table[:deleted_at].eq(nil)) if arel_table[:deleted_at]}
end
