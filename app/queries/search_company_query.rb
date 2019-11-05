# frozen_string_literal: true

class SearchCompanyQuery
  def call(collection, search_params)
    return collection if search_params.empty?

    filtered = scope_by_category(collection, search_params)
    filtered = scope_by_query(filtered, search_params)
    filtered = scope_by_party(filtered, search_params)
    scope_by_party_element(filtered, search_params)
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

    collection.joins(:categories).where(categories: { id: search_params[:category_id] }).distinct
  end

  def scope_by_party_element(collection, search_params)
    return collection if search_params[:party_element_id].blank?

    party_element = PartyElement.find(search_params[:party_element_id])

    if party_element.party_template_element.present?
      category_ids = party_element.party_template_element.category_ids
      scope_by_category(collection, category_id: category_ids)
    else
      collection
    end
  end

  def scope_by_party(collection, search_params)
    return collection if search_params[:party_id].blank?

    party = Party.find(search_params[:party_id])

    collection.where.not(id: party.company_ids)
  end
end
