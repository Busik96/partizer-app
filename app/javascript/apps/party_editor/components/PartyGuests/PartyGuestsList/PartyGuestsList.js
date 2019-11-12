import React from 'react';
import { Table } from 'reactstrap';
import PartyGuestsListElement from './../PartyGuestsListElement/PartyGuestsListElement';

const PartyGuestsList = ({ guests, loadPartyGuests, partyId }) => {
  return (
    <Table>
      <thead>
        <tr>
          <th>Imię i nazwisko</th>
          <th>Potwierdzenie obecności</th>
          <th>Akcje</th>
        </tr>
      </thead>
      <tbody>
        {guests.map((guest) =>
          <PartyGuestsListElement
          key={`guest_${guest.id}`}
          guest={guest}
          loadPartyGuests={loadPartyGuests}
          partyId={partyId}
          />)
        }
      </tbody>
    </Table>
  );
}

export default PartyGuestsList;
