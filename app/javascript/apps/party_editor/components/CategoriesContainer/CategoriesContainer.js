import React from 'react';
import { Badge } from 'reactstrap';

const Category = ({ category }) => (
  <Badge style={{ marginLeft: '5px' }}>{category.name}</Badge>
);

const CategoriesContainer = ({ categories }) => (
  <React.Fragment>
    {categories.map((category) => <Category key={`category_${category.id}`} category={category}/>)}
  </React.Fragment>
);

export default CategoriesContainer;
