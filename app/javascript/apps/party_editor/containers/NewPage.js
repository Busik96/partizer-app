import React from 'react'
import { useParams } from 'react-router-dom';
import { Row, Col } from 'reactstrap';
import { createPartyElement } from './../api/actions';
import CompanyList from './CompanyList';
import { useHistory } from 'react-router-dom';

class NewPage extends React.Component {

  selectCompany = (companyId) => {
     createPartyElement(this.props.party.id, companyId)
      .then((response) => {
        this.props.loadParty(() => {
          setTimeout(() => window.scrollTo({ top: 0, behavior: 'smooth' }), 100);
          this.props.history.push(`/${response.data.data.id}`);
        });
      })
      .catch((error) => console.log(error));
  }

  render(){
    const { party, categories } = this.props;

    return (
      <Row>
        <Col xs='12' md='12'>
          <h3 className="center-content">
            Wybierz z listy firmę, która Ciebie zainteresowała!
          </h3>
          <hr/>
          <br/>
          <CompanyList
            hideCompaniesForParty={party.id}
            onCompanySelect={this.selectCompany}
            categories={categories}
          />
        </Col>
      </Row>
    );
  }
}

export default (props) => {
  const history = useHistory();

  return <NewPage history={history} {...props} />;
};
