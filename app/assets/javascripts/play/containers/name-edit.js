import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { updateName } from '../actions/index'

export class NameEdit extends Component {
  constructor(props) {
    super(props);

    this.handleChange = this.handleChange.bind(this);
  }

  shouldComponentUpdate(nextProps, nextState) {
    console.log('nextProps (NameEdit)', nextProps);
    return true;
  }

  handleChange(e) {
    this.props.updateName({ newName: e.target.value });
  }

  render() {
    return (
      <div>
        <input value={this.props.name} onChange={this.handleChange} />
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ updateName }, dispatch);
}

function mapStateToProps({ event }) {
  return { name: event.name };
}

export default connect(mapStateToProps, mapDispatchToProps)(NameEdit);
