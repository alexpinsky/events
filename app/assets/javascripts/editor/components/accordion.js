import React, { Component } from 'react';

import AccordionPanel from './accordion-panel';

export default class Accordion extends Component {
  constructor(props) {
    super(props);

    this.panels        = {};
    this.openPanelName = null;

    this.handleClick = this.handleClick.bind(this);
  }

  componentDidMount() {
    this.panels[this.openPanelName].open();
  }

  shouldComponentUpdate(nextProps, nextState) {
    return false;
  }

  handleClick(panelName) {
    this.panels[this.openPanelName].close();
    this.panels[panelName].open();
    this.openPanelName = panelName;
  }

  renderPanels() {
    return this.props.items.map(function(item) {
      if (item.isOpen) {
        this.openPanelName = item.name;
      }

      return <AccordionPanel
                key={item.name}
                name={item.name}
                header={item.header}
                content={item.content}
                onClick={this.handleClick}
                ref={
                  (ref) => this.panels[item.name] = ref
                } />
    }.bind(this))
  }

  render() {

    return (
      <div className='accordion'>
        {this.renderPanels()}
      </div>
    );
  }
}
