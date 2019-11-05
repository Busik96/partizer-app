import React from 'react'
import { Spinner } from 'reactstrap';

const LoadingElement = ({ fullHeight }) => (
  <div className={`${fullHeight ? 'h-100' : null} center-content`}>
    <Spinner style={{ width: '5rem', height: '5rem' }} color='success' />
  </div>
);

LoadingElement.defaultProps = {
  fullHeight: false
}

export default LoadingElement;
