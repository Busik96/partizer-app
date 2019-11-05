import React, { useState } from 'react';
import { Input, Button, Toast, ToastBody, ToastHeader } from 'reactstrap';

class NotesElement extends React.Component {
  constructor(props) {
    super(props);
    this.state = {show: false, isDirty: false, currentValue: this.props.currentNotes || '' };
  }

  toggle = () => {
    this.setState((currentState) => ({ show: !currentState.show }));
    this.handleSubmit();
  };

  handleSubmit = () => {
    if (this.state.isDirty) {
      this.setState({ isDirty: false });
      this.props.onChange(this.state.currentValue);
    }
  };

  changeValue = (event) => {
    this.setState({ isDirty: true, currentValue: event.target.value });
  };

  handleChangeOnBlur = (event) => {
    this.handleSubmit();
  };

  componentDidUpdate(prevProps) {
    if (this.props.currentNotes != prevProps.currentNotes) {
      this.setState({ isDirty: false, currentValue: this.props.currentNotes || '' });
    }
  }

  render() {
    const { currentValue } = this.state;

    return (
      <div>
        <Button color="primary" onClick={this.toggle}>Notatki</Button>
        <br/>
        <br/>
        <Toast isOpen={this.state.show == true}>
          <ToastHeader toggle={this.toggle}>Notatki:</ToastHeader>
          <ToastBody>
            <Input
              style={{border: '1px solid white'}}
              type='textarea'
              placeholder='Napisz notatkę...'
              onBlur={this.handleChangeOnBlur}
              value={currentValue}
              onChange={this.changeValue}
            />
          </ToastBody>
        </Toast>
      </div>
    );
  }
}

export default NotesElement;
