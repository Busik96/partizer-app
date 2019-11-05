import React from 'react';
import PropTypes from 'prop-types';
import { Row, Col } from 'reactstrap';
import GoogleMapsElement from './../components/GoogleMapsElement/GoogleMapsElement';
import NotesElement from './../components/NotesElement/NotesElement';
import DetailedElementDetails from './../components/ElementDetails/DetailedElementDetails';
import { setPartyElementNotes } from './../api/actions';


class SummaryElement extends React.Component {
  static propTypes = {
    element: PropTypes.object
  };

  updateNotes = (notes) => {
    setPartyElementNotes(this.props.partyId, this.props.element.id, notes)
      .catch((error) => console.log(error));
  }

  render(){
    const { element } = this.props;

    return(
      <Row>
        <Col xs='12' md='4'>
          <DetailedElementDetails element={element}/>
        </Col>
        <Col xs='12' md='3' className='text-center'>
          <p>Kwota do zapłaty: {element.amount ? `${element.amount} zł` : 'nie podano'}</p>
          <p>Załatwione?
            {element.status == 'accepted' ?
              <span className='p-2 fas fa-check'/> :
              <span className='p-2 fas fa-times'/>
            }
          </p>
          <NotesElement currentNotes={element.notes} onChange={this.updateNotes}/>
        </Col>
        <Col xs='12' md='5'>
          <GoogleMapsElement
            latitude={element.company.address.latitude}
            longitude={element.company.address.longitude}
          />
        </Col>
      </Row>
    );
  }
};

export default SummaryElement;
