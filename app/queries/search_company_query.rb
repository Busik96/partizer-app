# frozen_string_literal: true

class SearchCompanyQuery
  def call(collection, search_params)
    return collection if search_params.empty?

    filtered = scope_by_category(collection, search_params)
    scope_by_query(filtered, search_params)
  end

  private

  def scope_by_query(collection, search_params)
    return collection if search_params[:query].blank?

    query = search_params[:query].downcase

    collection
      .joins(:address)
      .where(
        'LOWER(companies.name) LIKE ? OR companies.nip = ? OR LOWER(addresses.city) = ?',
        "%#{query}%",
        query,
        query
      )
  end

  def scope_by_category(collection, search_params)
    return collection if search_params[:category_id].blank?

    collection.joins(:categories).where(categories: { id: search_params[:category_id] })
  end
end
