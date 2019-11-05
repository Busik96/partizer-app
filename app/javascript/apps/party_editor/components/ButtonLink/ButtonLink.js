import React from 'react';
import PropTypes from 'prop-types';
import { Button } from 'reactstrap';
import { useHistory } from 'react-router-dom';

class ButtonLink extends React.Component {
  static propTypes = {
    to: PropTypes.string.isRequired,
    children: PropTypes.node,
    history: PropTypes.object.isRequired
  };

  redirect = () => {
    this.props.history.push(this.props.to);
  };

  render() {
    const { children, ...attributes } = this.props;

    return (
      <Button onClick={this.redirect} {...attributes}>{children}</Button>
    );
  }
}

export default (props) => {
  const history = useHistory();

  return <ButtonLink history={history} {...props}/>;
};
