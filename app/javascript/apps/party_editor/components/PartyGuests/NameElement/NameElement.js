import React, { useState, useEffect } from 'react';
import { Label, Input, InputGroup, InputGroupAddon, InputGroupText, Button } from 'reactstrap';

class NameElement extends React.Component {
  constructor(props) {
    super(props);
    this.state = { isDirty: false, currentValue: '' };
  }

  handleSubmit = () => {
    if (this.state.isDirty) {
      this.setState({ isDirty: false });
      this.props.onChange(this.state.currentValue);
    }
  };

  changeValue = (event) => {
    this.setState({ isDirty: true, currentValue: event.target.value });
  };

  handleChangeByKey = (event) => {
    if(event.charCode == 13){
      this.handleSubmit();
    }
  };


  render() {
    const { currentValue } = this.state;

    return (
       <InputGroup>
        <InputGroupAddon addonType="prepend">
          Dodaj swojego gościa:
        </InputGroupAddon>
        <Input
          placeholder='Wpisz imię i nazwisko...'
          onKeyPress={this.handleChangeByKey}
          value={currentValue}
          onChange={this.changeValue}
        />
        <InputGroupAddon addonType="append">
          <Button color="success" onClick={this.handleSubmit}>Dodaj</Button>
        </InputGroupAddon>
      </InputGroup>
    );
  }
}

export default NameElement;

