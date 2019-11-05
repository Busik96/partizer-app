import React from 'react';
import { Col, Card, CardBody, CardText, CardImg, CardTitle, Button } from 'reactstrap';
import ButtonSelect from './../ButtonSelect/ButtonSelect'

const showProfile = (id) => {
  window.open(`/companies/${id}`, '_blank');
};

const CompanyCard = ({ company, onCompanySelect, currentCompanyId }) => {


  return (
    <Col md='4' xs='12' className='text-center p-3'>
      <Card style={{ width: '18rem' }}>
        <CardImg className=' img card-img-top' src={company.main_photo_url}/>
        <CardBody>
          <CardTitle>{company.name}</CardTitle>
          <hr/>
          <CardText>{company.short_description}</CardText>
          <CardText>{company.address.city}</CardText>
          <Button onClick={() => showProfile(company.id)} className='btn-dark'>
            Zobacz więcej
          </Button>
          {Number.parseInt(company.id, 10) !== currentCompanyId ? <ButtonSelect
            onCompanySelect={onCompanySelect}
            companyId={company.id}
            company={company}
          /> : null}
        </CardBody>
      </Card>
    </Col>
  );
};

export default CompanyCard;
