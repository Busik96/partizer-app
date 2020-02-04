import React from 'react';
import { Table } from 'reactstrap';

const SimplePartyGuestsList = ({ guests, loadPartyGuests, partyId }) => {
  return (
    <Table>
      <thead>
        <tr>
          <th className='text-center'>Imię i nazwisko</th>
          <th className='text-center'>Potwierdzenie obecności</th>
        </tr>
      </thead>
      <tbody>
        {guests.map((guest) =>
          <tr>
            <td className='text-center'>{ guest.name }</td>
            <td className='text-center'>
              { guest.confirmed == true ?
                <span className='p-2 fas fa-check '/> :
                <span className='p-2 fas fa-times'/>
              }
            </td>
          </tr>
        )}
      </tbody>
    </Table>
  );
}

export default SimplePartyGuestsList;
