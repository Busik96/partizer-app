import React from 'react';
import PropTypes from 'prop-types';
import { ListGroupItem } from 'reactstrap';
import { Link } from 'react-router-dom';

const PartyGuests = () => {

  return (
    <ListGroupItem>
      <div>
        Lista gości
        <Link to="/guests" style={{ float: 'right' }}>Podgląd</Link>
      </div>
    </ListGroupItem>
  );
};


export default PartyGuests;
