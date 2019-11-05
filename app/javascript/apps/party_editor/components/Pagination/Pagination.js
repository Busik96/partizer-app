import React from 'react';
import PropTypes from 'prop-types';
import { Pagination as BSPagination, PaginationItem, PaginationLink } from 'reactstrap';

class Pagination extends React.Component {
  static propTypes = {
    currentPage: PropTypes.number.isRequired,
    perPage: PropTypes.number.isRequired,
    total: PropTypes.number.isRequired,
    onChange: PropTypes.func.isRequired
  }

  totalPages() {
    const { perPage, total, currentPage } = this.props;
    return Math.ceil(total / perPage);
  }

  isLastPage() {
    return this.props.currentPage == this.totalPages();
  }

  renderPrevious() {
    const { currentPage, onChange } = this.props;

    return (
      <PaginationItem disabled={currentPage == 1}>
        <PaginationLink first onClick={() => onChange(currentPage - 1)} />
      </PaginationItem>
    );
  }

  renderPages() {
    const { currentPage, onChange } = this.props;
    const previousPages = [];
    const nextPages = [];

    for (let i = currentPage - 1; i >= currentPage - 3 && i > 0; i--) {
      previousPages.push(
        <PaginationItem key={`page_${i}`}>
          <PaginationLink onClick={() => onChange(i)}>{i}</PaginationLink>
        </PaginationItem>
      );
    }

    for (let i = currentPage + 1; i <= currentPage + 3 && i <= this.totalPages(); i++) {
      nextPages.push(
        <PaginationItem key={`page_${i}`}>
          <PaginationLink onClick={() => onChange(i)}>{i}</PaginationLink>
        </PaginationItem>
      );
    }

    return (
      <React.Fragment>
        {previousPages.reverse()}
        <PaginationItem active key={`page_${currentPage}`}>
          <PaginationLink>{currentPage}</PaginationLink>
        </PaginationItem>
        {nextPages}
      </React.Fragment>
    );
  }

  renderNext() {
    const { currentPage, onChange } = this.props;

    return (
      <PaginationItem disabled={this.isLastPage()}>
        <PaginationLink last onClick={() => onChange(currentPage + 1)} />
      </PaginationItem>
    );
  }

  render() {
    if (this.totalPages() <= 1) { return null; }
    return (
      <BSPagination className={this.props.className}>
        {this.renderPrevious()}
        {this.renderPages()}
        {this.renderNext()}
      </BSPagination>
    );
  }
}

export default Pagination;
