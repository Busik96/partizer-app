import React from 'react'
import { useParams } from 'react-router-dom';
import { Row, Col } from 'reactstrap';
import { getPartyGuestsDetails, createPartyGuest, setPartyGuestConfirmed } from './../api/actions';
import { useHistory } from 'react-router-dom';
import Jsona from 'jsona';
import NameElement from './../components/PartyGuests/NameElement/NameElement'
import PartyGuestsList from './../components/PartyGuests/PartyGuestsList/PartyGuestsList'
import isEmpty from 'lodash/isEmpty';
import PageLoader from './../components/LoadingElement/PageLoader';

class PartyGuestsPage extends React.Component {
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

  addGuest = (name) => {
   createPartyGuest(this.props.party.id, name)
    .then(() => this.loadPartyGuests())
    .catch((error) => console.log(error));
  };


  render() {
    const { guests, isLoading } = this.state;
    if (isLoading) { return <PageLoader/>; }
    return(
      <Row>
        <Col md='12'>
          { isEmpty(guests) ?
            <h4 className='text-center'> Dodaj swojego pierwszego gościa do listy! </h4>
            : <h4 className='text-center'> Lista gości: </h4>
          }
          { isEmpty(guests) ?
             null :
            <PartyGuestsList
              guests={guests}
              loadPartyGuests={this.loadPartyGuests}
              partyId={this.props.party.id}
            />
          }
          <br/>
          <NameElement onChange={this.addGuest}/>
        </Col>
      </Row>
    );
  }
}

export default (props) => {
  const history = useHistory();

  return <PartyGuestsPage history={history} {...props} />;
};
