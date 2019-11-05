import React from 'react';
import LoadingElement from './LoadingElement';
import './PageLoader.scss';

const PageLoader = () => (
  <div className='pageLoader'>
    <LoadingElement fullHeight/>
  </div>
);

export default PageLoader;
