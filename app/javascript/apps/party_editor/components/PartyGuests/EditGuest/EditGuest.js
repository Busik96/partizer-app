import React, { useState } from 'react';
import { Button, Modal, ModalHeader, ModalBody, ModalFooter, Input } from 'reactstrap';

const EditGuest = ({onChange, guest}) => {

  const [modal, setModal, isDirty] = useState(false);

  const toggle = () => setModal(!modal);

  var currentValue = guest.name

  const handleSubmit = () => {
    onChange(currentValue);
  };

  const changeValue = (event) => {
    currentValue = event.target.value
  };

  const handleChangeByKey = (event) => {
    if(event.charCode == 13){
      handleSubmit();
      toggle();
    }
  };

  return (
    <div>
      <Button color="success" onClick={toggle} className='float-left fas fa-edit'/>
      <Modal isOpen={modal} toggle={toggle} >
        <ModalHeader toggle={toggle}>Edycja</ModalHeader>
        <ModalBody>
          <Input
            onKeyPress={handleChangeByKey}
            defaultValue={currentValue}
            onChange={changeValue}
          />
        </ModalBody>
        <ModalFooter>
          <Button color="primary" onClick={handleSubmit}>Zapisz</Button>{' '}
          <Button color="secondary" onClick={toggle}>Anuluj</Button>
        </ModalFooter>
      </Modal>
    </div>
  );
}

export default EditGuest;
