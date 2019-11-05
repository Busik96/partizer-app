import React from 'react';
import { Toast, ToastBody, ToastHeader, Badge } from 'reactstrap';
import CategoriesContainer from './../CategoriesContainer/CategoriesContainer';


const ElementDetails = ({ element }) => {
  const renderCategories = () => {
    const categories = element.party_template_element.categories;

    return (
      <CategoriesContainer categories={categories}/>
    );
  }

  const renderPhoneNumber = () => {
    if (element.company.address.phone_number) {
      return `Numer telefonu: ${element.company.address.phone_number}`;
    }
  }

  return (
    <Toast>
      <ToastHeader>
        { element.company_id ? element.company.name : element.party_template_element.name }
        <span>  {element.company_id ? <Badge>{element.company.address.city}</Badge> : renderCategories()}</span>
      </ToastHeader>
      <ToastBody>
        { element.company_id ? element.company.short_description : element.party_template_element.description }
        <br/>
        { element.company ?
          renderPhoneNumber()
          : null }
      </ToastBody>
    </Toast>
  );
};

export default ElementDetails;
