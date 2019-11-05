import React from 'react';
import PropTypes from 'prop-types';
import Jsona from 'jsona';
import { Col, Row } from 'reactstrap'
import isEmpty from 'lodash/isEmpty';
import { getCompanies, COMPANIES_PER_PAGE } from './../api/actions';
import LoadingElement from './../components/LoadingElement/LoadingElement';
import CompanyCard from './../components/CompanyCard/CompanyCard';
import CompaniesCardList from './../components/CompaniesCardList/CompaniesCardList';
import Pagination from './../components/Pagination/Pagination';
import { Button, Input } from 'reactstrap';
import SearchBar from './../components/SearchBar/SearchBar'
import MultiSelector from './../components/MultiSelector/MultiSelector'

class CompanyList extends React.Component {
  static propTypes = {
    elementId: PropTypes.string,
    onCompanySelect: PropTypes.func.isRequired,
    currentCompanyId: PropTypes.number,
    hideCompaniesForParty: PropTypes.string,
    categories: PropTypes.array
  };

  static defaultProps = {
    elementId: null,
    hideCompaniesForParty: null
  }

  constructor(props) {
    super(props);
    this.state = {
      companies: [],
      currentCategory: null,
      currentQuery: '',
      currentPage: 1,
      totalElements: 0,
      isLoading: false
    };
  }

  resetState() {
    this.setState({
      companies: [],
      currentCategory: null,
      currentQuery: '',
      currentPage: 1,
      totalElements: 0,
      isLoading: false
    });
  }

  componentDidMount() {
    this.resetState();
    this.loadCompanies();
  }

  componentDidUpdate(prevProps) {
    if (this.props.elementId != prevProps.elementId) {
      this.resetState();
      this.loadCompanies();
    }
  }

  loadCompanies = () => {
    const { currentCategory, currentQuery, currentPage } = this.state;
    const { hideCompaniesForParty } = this.props;
    this.setState({ isLoading: true });
    getCompanies(currentCategory, currentQuery, this.props.elementId, currentPage, hideCompaniesForParty)
      .then((response) => {
        const jsona = new Jsona();
        this.setState({
          companies: jsona.deserialize(response.data),
          totalElements: Number.parseInt(response.headers.total, 10)
        });
      })
      .finally(() => this.setState({ isLoading: false }));
  }

  changeCurrentPage = (page) => {
    this.setState({ currentPage: page }, () => {
      this.loadCompanies();
    });
  }

  setQuery = (event) => {
    this.setState({ currentQuery: event.target.value });
  }

  setCategories = (value) => {
    this.setState({ currentCategory: value }, () => {
      this.loadCompanies();
    });
  }

  render() {
    const { currentQuery, currentPage, totalElements, companies } = this.state;
    const { categories } = this.props;

    return (
      <React.Fragment>
        <Row>
          <SearchBar currentQuery={currentQuery} setQuery={this.setQuery} loadCompanies={this.loadCompanies}/>
          <Col xs='12' md='6'>
            { categories ?
              <MultiSelector collection={categories} onChange={this.setCategories} />
              : null
            }
          </Col>
        </Row>
        <Row>
          <Col xs='12'>
            {this.state.isLoading ?
              <LoadingElement/> :
              <CompaniesCardList
                onCompanySelect={this.props.onCompanySelect}
                companies={companies}
                currentCompanyId={this.props.currentCompanyId}
              />
            }
            <Pagination
              currentPage={currentPage}
              perPage={COMPANIES_PER_PAGE}
              total={totalElements}
              onChange={this.changeCurrentPage}
              className='center-content'
            />
          </Col>
        </Row>
      </React.Fragment>
    );
  }
}

export default CompanyList;
