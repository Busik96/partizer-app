import React from 'react';
import PropTypes from 'prop-types';
import { ListGroupItem } from 'reactstrap';
import { Link } from 'react-router-dom';
import './PartyElement.scss';

const PartyElement = ({ element }) => {

  return (
    <ListGroupItem
      className={`justify-content-between PartyElement ${element.status == 'accepted' ? 'PartyElement--accepted' : null}`}
    >
      <div>
        {element.party_template_element ? element.party_template_element.name : null}
        <Link to={element.id} style={{ float: 'right' }}>Edytuj</Link>
      </div>
      <div>
        {element.company_id ? element.company.name : 'Nie wybrano jeszcze firmy!'}
      </div>
    </ListGroupItem>
  );
};

PartyElement.propTypes = {
  element: PropTypes.object.isRequired
};

export default PartyElement;
