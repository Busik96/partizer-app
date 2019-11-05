import React from 'react'
import './DropdownElementList.scss';
import './DropdownElement.scss'

const DropdownElement = ({ element, onClick }) => {
  const handleClick = () => {
    onClick(element.id);
  }

  return(
    <li className='elementDropdown' onClick={handleClick}>
      {element.value}
    </li>
  );
};

const DropdownElementsList = ({ collection, onSelect }) => {

  return(
    <div className='DropdownElementList'>
      <ul>
        { collection.map(
          ( element ) =>
            <DropdownElement
              key={`dropdownElement_${element.id}`}
              element={element}
              onClick={onSelect}
            />
          )
        }
      </ul>
    </div>
  );
};

export default DropdownElementsList;
