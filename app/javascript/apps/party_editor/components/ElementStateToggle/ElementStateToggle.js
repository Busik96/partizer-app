import React from 'react'
import { Label, Input } from 'reactstrap';

const mapStateToValue = (currentState) => currentState == 'accepted';

const ElementStateToggle = ({ currentState, onChange }) => {
  const handleOnChange = () => {
    const state = mapStateToValue(currentState);
    onChange(state ? 'pending' : 'accepted');
  };

  return (
    <Label check>
      <Input
        type="checkbox"
        onChange={handleOnChange}
        checked={mapStateToValue(currentState)}
      /> Załatwione ?
    </Label>
  );
};

export default ElementStateToggle;

