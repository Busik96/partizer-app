import React from 'react';
import { Row, Col } from 'reactstrap';
import CompanyCard from './../CompanyCard/CompanyCard';
import isEmpty from 'lodash/isEmpty';

const CompaniesCardList = ({ companies, onCompanySelect, currentCompanyId }) => (
  <Row>
    {isEmpty(companies) ?
      <Col xs="12" className='text-center'>
        <h5 className='m-4'>Niestety nie mamy firm spełniających te kryteria</h5>
      </Col> : null
    }
    {companies.map((company) =>
      <CompanyCard
        key={`company_card_${company.id}`}
        company={company}
        currentCompanyId={currentCompanyId}
        onCompanySelect={onCompanySelect}
      />)
    }
  </Row>
);

export default CompaniesCardList;
