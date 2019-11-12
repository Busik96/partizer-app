import React from 'react';
import { CustomInput } from 'reactstrap';
import ButtonDelete from './../../ButtonDelete/ButtonDelete';
import EditGuest from './../EditGuest/EditGuest'
import { setPartyGuestConfirmed, deletePartyGuest, setPartyGuestName } from './../../../api/actions';


class PartyGuestsListElement extends React.Component {

  updateName = (name) => {
    setPartyGuestName(this.props.partyId, this.props.guest.id, name)
      .then(() => this.props.loadPartyGuests())
      .catch((error) => console.log(error));
  }

  updateConfirmed = (confirmed) => {
    setPartyGuestConfirmed(this.props.partyId, this.props.guest.id, confirmed)
      .then(() => this.props.loadPartyGuests())
      .catch((error) => console.log(error));
  }

  deleteElement = () => {
    deletePartyGuest(this.props.partyId, this.props.guest.id)
      .then(() => this.props.loadPartyGuests())
      .catch((error) => console.log(error));
  }

  stateToggle = (state) => {
    if (state == true) {
      return 'Potwierdzono'
    } else {
      return 'Nie potwierdzono'
    }
  };

  handleOnChange = () => {
      const currentState = this.props.guest.confirmed;
    this.updateConfirmed(currentState ? false : true);
  };

  render () {
    const { guest } = this.props;
    return (
      <tr>
        <td>{ guest.name }</td>
        <td>
          <CustomInput
              type="switch"
              label={this.stateToggle(guest.confirmed)}
              id={guest.id}
              checked={guest.confirmed}
              onChange={this.handleOnChange}
          />
        </td>
        <td>
          <EditGuest onChange={this.updateName} guest={guest} />
          <ButtonDelete onClick={this.deleteElement} className='text-center'/>
        </td>
      </tr>
    );
  }
}

export default PartyGuestsListElement;
