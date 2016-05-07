import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import EventViewer from '../shared/containers/event-viewer';
import Spinner from '../shared/components/spinner';
import { setEvent, eventViewed } from './actions';

export default class App extends Component {

  constructor(props) {
    super(props);

    this.handleViewerMount = this.handleViewerMount.bind(this);
  }

  componentDidMount() {
    $('.overlay').remove();

    const event = $('.view-container').data('event');
    this.props.setEvent(event);
  }

  handleViewerMount() {
    this.props.eventViewed(this.props.event.id);
  }

  render() {
    if (this.props.event.id) {
      return <EventViewer onMount={this.handleViewerMount} />
    }
    else {
      return <Spinner />
    }
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ setEvent, eventViewed }, dispatch);
}

function mapStateToProps(state) {
  return { event: state.event }
}

export default connect(mapStateToProps, mapDispatchToProps)(App);
