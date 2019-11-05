import React from 'react'
import { useParams } from 'react-router-dom';
import { Row, Col } from 'reactstrap';
import ElementStateToggle from './../components/ElementStateToggle/ElementStateToggle';
import AmountInput from './../components/AmountInput/AmountInput';
import ButtonDelete from './../components/ButtonDelete/ButtonDelete';
import { setPartyElementStatus, setPartyElementAmount, setCompanyId, deletePartyElement } from './../api/actions';
import CompanyList from './CompanyList';
import { useHistory } from 'react-router-dom';
import ElementDetails from './../components/ElementDetails/ElementDetails';

class EditPage extends React.Component {

  updateAmount = (amount) => {
    setPartyElementAmount(this.props.party.id, this.props.element.id, amount)
      .then(() => this.props.loadParty())
      .catch((error) => console.log(error));
  }

  updateStatus = (status) => {
    setPartyElementStatus(this.props.party.id, this.props.element.id, status)
      .then(() => this.props.loadParty())
      .catch((error) => console.log(error));
  }

  selectCompany = (companyId) => {
     setCompanyId(this.props.party.id, this.props.element.id, companyId)
      .then(() => {
        this.props.loadParty();
        setTimeout(() => window.scrollTo({ top: 0, behavior: 'smooth' }), 100);
      })
      .catch((error) => console.log(error));
  }

  deleteElement = () => {
    deletePartyElement(this.props.party.id, this.props.element.id)
      .then(() => {
        this.props.loadParty();
        if (!this.props.element.party_template_element) {
          this.props.history.push('/');
        }
      })
  }


  render(){
    const { element } = this.props;

    return (
      <React.Fragment>
        <Row>
          <Col xs='12' md='6'>
            <ElementDetails element= { element }/>
          </Col>
          { element.company_id ?
            <React.Fragment>
              <Col xs='12' md='2'>
                <ElementStateToggle currentState={element.status} onChange={this.updateStatus}/>
              </Col>
              <Col xs='12' md='2'>
                <AmountInput currentAmount={element.amount} onChange={this.updateAmount}/>
              </Col>
              <Col xs='12' md='2'>
                <ButtonDelete
                  onClick={this.deleteElement}
                />
              </Col>
            </React.Fragment>
            : null
          }
        </Row>
        <Row>
          <Col xs='12' md='12'>
            <hr/>
            { element.company_id ?
              <h3 className="center-content">
               Możesz w dowolnym momencie zmienić swój wybór!
              </h3>
              :
              <h3 className="center-content">
                Wybierz z listy firmę, która Ciebie zainteresowała!
              </h3>
            }
            <br/>
            <CompanyList
              elementId={element.id}
              onCompanySelect={this.selectCompany}
              currentCompanyId={element.company_id}
            />
          </Col>
        </Row>
      </React.Fragment>
    );
  }
}

export default (props) => {
  const { id } = useParams();
  const history = useHistory();

  const element = props.party.party_elements.find((el) => el.id == id);

  return <EditPage history={history} element={element} {...props} />;
};

