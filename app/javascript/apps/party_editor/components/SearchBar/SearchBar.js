import React from 'react';
import PropTypes from 'prop-types';
import { Button, Input, Row, Col } from 'reactstrap';

class SearchBar extends React.Component {
  static propTypes = {
    setQuery: PropTypes.func.isRequired,
    currentQuery: PropTypes.string.isRequired,
    loadCompanies: PropTypes.func.isRequired,
  };

  handleKeyPress = (event) => {
    if(event.charCode == 13){
      this.props.loadCompanies();
    }
  }

  render () {
    const { currentQuery, setQuery, loadCompanies } = this.props;

    return (
      <React.Fragment>
        <Col xs='8' md='4'>
          <Input
            className='form-control'
            value={currentQuery}
            onChange={setQuery}
            onKeyPress={this.handleKeyPress}
            placeholder='Wyszukaj...'
          />
        </Col>
        <Col xs='4' md='2'>
          <Button outline color="success" onClick={loadCompanies}>
            Szukaj
          </Button>
        </Col>
      </React.Fragment>
    );
  }
}
export default SearchBar;
