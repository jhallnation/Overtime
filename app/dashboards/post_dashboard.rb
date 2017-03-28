require "administrate/base_dashboard"

class PostDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo.with_options(searchable: false),
    id: Field::Number.with_options(searchable: false),
    date: Field::DateTime.with_options(searchable: false),
    ratinale: Field::Text.with_options(searchable: true),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
    status: Field::Text.with_options(searchable: true),
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :user,
    :status,
    :date,
    :ratinale,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :status,
    :id,
    :date,
    :ratinale,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :user,
    :date,
    :ratinale,
  ].freeze

end