import React from 'react';
import { Button, Toast, ToastBody, ToastHeader, Badge } from 'reactstrap';
import CategoriesContainer from './../CategoriesContainer/CategoriesContainer';


const DetailedElementDetails = ({ element }) => {
  const renderCategories = () => {
    const categories = element.company.categories;

    return (
      <CategoriesContainer categories={categories}/>
    );
  }

  const showProfile = (id) => {
    window.open(`/companies/${id}`, '_blank');
  };

  return (
    <Toast>
      <ToastHeader>
        {element.company.name}
        <span>  {element.company.categories ? renderCategories() : null }</span>
      </ToastHeader>
      <ToastBody>
        { element.company.short_description ?
        <p>Krótki opis: <br/>
          {element.company.short_description}
        </p> : null }
        { element.company.address.phone_number ?
        <p>Numer telefonu: <br/>
          {element.company.address.phone_number}
        </p> : null }
        <p>
          Adres:<br/>
          {element.company.address.address1}<br/>
          {`${element.company.address.zipcode} ${element.company.address.city}`}<br/>
        </p>
        <Button
          outline color='success'
          size='sm'
          onClick={() => showProfile(element.company.id)}
         >
            Zobacz więcej
        </Button>

      </ToastBody>
    </Toast>
  );
};

export default DetailedElementDetails;
