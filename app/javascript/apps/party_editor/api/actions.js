import api from './api';

export const COMPANIES_PER_PAGE = 9;

export const getPartyDetails = (partyId) => {
  return api.get(`/parties/${partyId}`);
}

export const setPartyElementStatus = (partyId, elementId, status) => {
  return api.patch(`/parties/${partyId}/party_elements/${elementId}`, { status });
};

export const setPartyElementAmount = (partyId, elementId, amount) => {
  return api.patch(`/parties/${partyId}/party_elements/${elementId}`, { amount });
};

export const setPartyElementNotes = (partyId, elementId, notes) => {
  return api.patch(`/parties/${partyId}/party_elements/${elementId}`, { notes });
};

export const setCompanyId = (partyId, elementId, companyId) => {
  return api.patch(`/parties/${partyId}/party_elements/${elementId}`, { company_id: companyId });
};

export const deletePartyElement = (partyId, elementId) => {
  return api.delete(`/parties/${partyId}/party_elements/${elementId}`);
};

export const createPartyElement = (partyId, companyId) => {
  return api.post(`/parties/${partyId}/party_elements`, { company_id: companyId });
};

export const setPartyGuestName = (partyId, guestId, name) => {
  return api.patch(`/parties/Status${partyId}/party_guests/${guestId}`, { name });
};

export const setPartyGuestConfirmed = (partyId, guestId, confirmed) => {
  return api.patch(`/parties/${partyId}/party_guests/${guestId}`, { confirmed });
};

export const deletePartyGuest = (partyId, guestId) => {
  return api.delete(`/parties/${partyId}/party_guests/${guestId}`);
};

export const createPartyGuest = (partyId) => {
  return api.post(`/parties/${partyId}/party_guests`);
};

export const getCompanies = (categoryId = null, query = null, elementId = null, page = 1, partyId = null) => {
  return api.get(
    `/companies`,
    {
      params: {
        category_id: categoryId,
        party_element_id: elementId,
        query,
        page,
        party_id: partyId,
        per_page: COMPANIES_PER_PAGE
      }
    }
  );
};
