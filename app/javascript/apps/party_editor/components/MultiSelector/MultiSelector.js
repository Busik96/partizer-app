import React from 'react';
import PropTypes from 'prop-types';
import { Col } from 'reactstrap';
import './MultiSelector.scss';
import SelectedElementsList from './SelectedElementsList/SelectedElementsList';
import DropdownElementsList from './DropdownElementsList/DropdownElementsList';


class MultiSelector extends React.Component {
  static propTypes = {
    collection: PropTypes.array,
    onChange: PropTypes.func.isRequired
  };

  constructor(props) {
    super(props);
    this.state = {
      isActive: false,
      selectedElements: []
    };
  }

  activate = (event) => {
    console.log(event.target.className);
    if (this.props.collection.length == this.state.selectedElements.length) {
      return;
    }

    if (event.target.className == 'MultiSelector' ||
      event.target.className == 'SelectorEmpty' ||
      event.target.className == 'SelectedElementsList') {
      this.setState({ isActive: true });
    }
  }

  deactivate = () => {
    console.log('deaktywuje');
    this.setState({ isActive: false });
  }

  selectElement = (elementId) => {
    const element = this.props.collection.find((el) => el.id == elementId);
    const newCollection = this.state.selectedElements;
    newCollection.push(element);
    this.setState({
      selectedElements: newCollection,
      isActive: false
    }, this.changeValue);
  }

  deselectElement = (elementId) => {
    this.setState({
      selectedElements: this.state.selectedElements.filter((el) => el.id != elementId),
      isActive: false
    }, this.changeValue);
  }

  changeValue = () => {
    this.props.onChange(this.state.selectedElements.map((el) => el.id));
  }

  filterCollection() {
    const selectedIds = this.state.selectedElements.map((el) => el.id);
    return this.props.collection.filter((el) => !selectedIds.includes(el.id));
  }

  render (){
    const filteredCollection = this.filterCollection();

    return(
      <div
        tabIndex='0'
        className='MultiSelector'
        onClick={this.activate}
        onBlur={this.deactivate}
      >
        {this.state.selectedElements.length > 0 ?
          <SelectedElementsList collection={this.state.selectedElements} onRemove={this.deselectElement}/> :
          null
        }
        {this.state.selectedElements.length == 0 && !this.state.isActive ? <span className='SelectorEmpty'>Wybierz kategorie...</span> : null}
        {this.state.isActive ?
          <DropdownElementsList collection={filteredCollection} onSelect={this.selectElement}/> :
          null
        }
      </div>
    );
  }
}
export default MultiSelector;

//
// Jak to ma dzialac
// MultiSelector dostaje:
// listeElementow (tzw.collection)
// currentValue (czyli co user wybral)
// onChange (wysle currentValue gdziestam)
// CategoriesSelector co robi:
// ma stan - lista otwarta badz zamknieta,
// jesli lista otwarta, renderujemy liste elementow z COLLECTION
// jesli Selector traci focus, ukrywamy liste
// poza tym
// wyswietla wybrane elementy (currentValue) w formie tagów, kazdy dupslik można usunąć
//
//
// Struktura komponentów
// MultiSelector - master który trzyma stan i listy
// DropdownList - komponent który wyswietla liste element, dostaje kolekcje, przefiltrowana - gotowe
// DropdownElement - pojedynczy element listy (jedyne co trzyma ), jedyne co robi to daje znac ze ktos w niego kliknal - gotowe
// SelectedElementsList - dostaje liste wybranych elementow i je wyswietla - gotowe
// SelectedElement - wyswietla pojedyncza wybrana wartosc + obsluga klikniecia w X   - gotowe
