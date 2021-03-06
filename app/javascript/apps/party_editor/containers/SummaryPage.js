import React from 'react'
import { Row, Col, Button } from 'reactstrap'
import { useParams, useHistory } from 'react-router-dom';
import GoogleMapsElement from './../components/GoogleMapsElement/GoogleMapsElement'
import NotesElement from './../components/NotesElement/NotesElement'
import SummaryElement from './SummaryElement'
import { getPartyGuestsDetails } from './../api/actions';
import Jsona from 'jsona';
import SimplePartyGuestsList from './../components/PartyGuests/SimplePartyGuestsList/SimplePartyGuestsList'

class SummaryPage extends React.Component {
  constructor(props) {
    super(props);
    this.state = { guests: [], isLoading: false };
  }

  componentDidMount() {
    this.loadPartyGuests();
  }

  loadPartyGuests = (callback = null) => {
    this.setState({ isLoading: true });
    getPartyGuestsDetails(this.props.party.id).then((response) => {
      const jsona = new Jsona();
      this.setState({ guests: jsona.deserialize(response.data) }, callback);
    })
    .catch((error) => {
      console.log(error);
    })
    .finally(() => this.setState({ isLoading: false }));
    };

  render(){
    const { party, elements } = this.props;
    const { guests } = this.state;

    return (
      <React.Fragment>
        <Row>
          <Col xs='12' md='6'>
            <h3>{party.name}{party.party_template ? ` (${party.party_template.name})` : null }</h3>
            {party.address ? `${party.address.address1}, ${party.address.zipcode} ${party.address.city}` : null}
          </Col>
          <Col xs='12' md='6' className='center-content'>
            <h5>Data imprezy:  {party.start_date} / {party.end_date}</h5>
          </Col>
        </Row>
        <hr/>
        <Row>
          <Col xs='12'>
            { elements.length > 0 ?
              <h5 className='p-4 text-center'>
                Poniżej najważniejsze informacje na temat wybranych przez Państwo firm:<br/>
              </h5> :
              <h5 className='p-4 text-center'>
                Nie wybrałeś jeszcze żadnej firmy!<br/>
                Możesz to zmienić korzystając z menu po lewej  <i className="fas fa-grin-alt"></i>
              </h5>
            }
          </Col>
        </Row>
        <Row>
          { elements.map(( element ) =>
            <Col xs='12' key={`summaryElement_${element.id}`}>
              <SummaryElement
                element={element}
                partyId={party.id}
              />
              <hr/>
            </Col>)
          }
        </Row>
        <Row>
          <Col xs='12' mr-5 ml-5>
            <h5 className="p-4 text-center">Lista gości:</h5>
            <SimplePartyGuestsList
              guests={guests}
              loadPartyGuests={this.loadPartyGuests}
              partyId={this.props.party.id}
            />
          </Col>
        </Row>
      </React.Fragment>
    );
  }
}

export default (props) => {
  const history = useHistory();

  const elements = props.party.party_elements.filter((el) => el.company_id);

  return <SummaryPage history={history} elements={elements} {...props} />;
};
