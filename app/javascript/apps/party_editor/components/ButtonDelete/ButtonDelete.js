import React from 'react'
import { Button } from 'reactstrap'

const ButtonDelete = ({ onClick }) => {
  return(
    <div className='center-content'>
      <Button onClick={onClick} className='fas fa-trash-alt'/>
    </div>
  );
}

export default ButtonDelete;
