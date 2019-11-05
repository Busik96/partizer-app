import React from 'react';
import './SelectedElement.scss';

const SelectedElement = ({ element, onClick }) => {
  const removeClicked = () => {
    onClick(element.id);
  };

  return(
    <li className='elementSelected'>
      <span onClick={removeClicked} className='fas fa-times removeButton'/>
      {element.value}
    </li>
  );
};

const SelectedElementsList = ({ collection, onRemove }) => {
  return(
    <ul className="SelectedElementsList">
      {collection.map((element) =>
        <SelectedElement
          key={`element_${element.id}`}
          element={element}
          onClick={onRemove}
        />)
      }
    </ul>
  );
};

export default SelectedElementsList;
