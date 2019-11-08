import React, { useState, useEffect } from 'react';
import { Label, Input, InputGroup, InputGroupAddon, InputGroupText } from 'reactstrap';
import ButtonDelete from './../../ButtonDelete/ButtonDelete'

class NameElement extends React.Component {
  constructor(props) {
    super(props);
    this.state = { isDirty: false, currentValue: this.props.currentName || '' };
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

  handleChangeOnBlur = (event) => {
    this.handleSubmit();
  };

  componentDidUpdate(prevProps) {
    if (this.props.currentName != prevProps.currentName) {
      this.setState({ isDirty: false, currentValue: this.props.currentName || '' });
    }
  }

  render() {
    const { currentValue } = this.state;

    return (
      <InputGroup>
        <Label>Kwota do zapłaty:</Label>
        <Input
          placeholder='Wpisz gościa'
          onKeyPress={this.handleChangeByKey}
          onBlur={this.handleChangeOnBlur}
          value={currentValue}
          onChange={this.changeValue}
        />
        <InputGroupAddon addonType='append'>
          <InputGroupText>

          </InputGroupText>
        </InputGroupAddon>
      </InputGroup>
    );
  }
}

export default NameElement;

