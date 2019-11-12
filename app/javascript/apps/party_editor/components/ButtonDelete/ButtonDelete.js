import React from 'react'
import { Button } from 'reactstrap'

const ButtonDelete = ({ onClick, className }) => {
  const windowConfirm = () => {
    if (confirm('Czy na pewno?') == true ) {
      onClick()
    };
  }
  return(
    <div className={className}>
      <Button
        onClick={windowConfirm}
        className='fas fa-trash-alt'
      />
    </div>
  );
}

export default ButtonDelete;
