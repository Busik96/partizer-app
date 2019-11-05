import React from 'react';
import PropTypes from 'prop-types';
import ButtonLink from './../ButtonLink/ButtonLink';

const Sidebar = ({ children, partyName, templateName }) => (
  <React.Fragment>
    <h5 className="text-light">{partyName} {templateName ? <small>({templateName})</small> : null}</h5>
    {children}
    <br/>
    <ButtonLink to="/new" color="success" size="sm">Dodaj nowy element</ButtonLink>
    <ButtonLink to="/" color="danger" size="sm" style={{ float: "right"}}>Podsumuj</ButtonLink>
  </React.Fragment>
);

Sidebar.propTypes = {
  children: PropTypes.node,
  partyName: PropTypes.string.isRequired,
  templateName: PropTypes.string,
};

export default Sidebar;

