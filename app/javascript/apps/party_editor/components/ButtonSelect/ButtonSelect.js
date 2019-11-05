import React from 'react';
import { Button } from 'reactstrap';


const ButtonSelect = ({ onCompanySelect, company }) => {
  const handleOnChange = (event) => {
    onCompanySelect(company.id);
  };

  return(
    <Button
      style={{ marginLeft: '5px' }}
      outline color="success"
      size="lg"
      onClick={handleOnChange}
      className='fas fa-check'
    >
    </Button>
  );
}

export default ButtonSelect;
