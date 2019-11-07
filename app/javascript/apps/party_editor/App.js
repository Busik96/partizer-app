import React from 'react';
import PropTypes from 'prop-types';
import { Button, Row, Col, Container } from 'reactstrap';
import Jsona from 'jsona';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";
import isEmpty from 'lodash/isEmpty';
import Sidebar from './components/Sidebar/Sidebar';
import PartyElements from './components/PartyElements/PartyElements';
import EditPage from './containers/EditPage';
import NewPage from './containers/NewPage';
import SummaryPage from './containers/SummaryPage';
import { getPartyDetails } from './api/actions';
import LoadingElement from './components/LoadingElement/LoadingElement';
import PageLoader from './components/LoadingElement/PageLoader';

class App extends React.Component {
  static propTypes = {
    partyId: PropTypes.string.isRequired,
    basename: PropTypes.string.isRequired
  }

  constructor(props) {
    super(props);
    this.state = { party: {}, isLoading: false };
  }

  componentDidMount() {
    this.loadParty();
  }

  loadParty = (callback = null) => {
    this.setState({ isLoading: true });
    getPartyDetails(this.props.partyId).then((response) => {
      const jsona = new Jsona();
      this.setState({ party: jsona.deserialize(response.data) }, callback);
    })
    .catch((error) => {
      console.log(error);
    })
    .finally(() => this.setState({ isLoading: false }));
  }

  render () {
    const { party, isLoading } = this.state;
    const { basename, categories } = this.props;

    if (isEmpty(this.state.party)) { return <PageLoader/>; }
    return (
      <Router basename={basename}>
        <Container fluid>
          <Row>
            <Col xs="12" sm="3" className="bg-dark">
              <Sidebar
                partyName={party.name}
                templateName={party.party_template ? party.party_template.name : null}
              >
                {isLoading ? <LoadingElement/> : <PartyElements elements={party.party_elements}/>}
              </Sidebar>
            </Col>
            <Col xs="12" sm="9" id="page-content">
              <Switch>
                <Route exact path="/">
                  <SummaryPage party={party} loadParty={this.loadParty}/>
                </Route>
                <Route path="/new">
                  <NewPage party={party} loadParty={this.loadParty} categories={categories}/>
                </Route>
                <Route path="/:id">
                  <EditPage party={party} loadParty={this.loadParty}/>
                </Route>
              </Switch>
            </Col>
          </Row>
        </Container>
      </Router>
    );
  }
}

const PartyProvider = (props) => {
  return (<App partyId={props.party_id} basename={props.current_url} categories={props.categories}/>)
};

export default PartyProvider;


