import React from 'react';
import PropTypes from 'prop-types';
import PartyElement from './../PartyElement/PartyElement';
import { ListGroup } from 'reactstrap';


const PartyElements = ({ elements }) => (
  <ListGroup>
    {elements.map((element) => <PartyElement key={`party_element_${element.id}`} element={element}/>)}
  </ListGroup>
);

PartyElements.propTypes = {
  elements: PropTypes.array.isRequired
};

export default PartyElements;
