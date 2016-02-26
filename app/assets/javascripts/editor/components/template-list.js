import React, { Component } from 'react';
import Template from './template';

export default class TemplateList extends Component {
  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  shouldComponentUpdate(nextProps, nextState) {
    return false;
  }

  handleClick(template) {
    this.props.onTemplateClick(template);
  }

  renderContent() {
    if (this.props.templates === undefined) {
      return this.renderPlaceHolder();
    }
    else {
      return this.renderTemplates();
    }
  }

  renderPlaceHolder() {
    return (
      <div
        className={`coming-soon ${this.props.name}`}
        data-category={this.props.name.toUpperCase()} >
        <div className="category-text">COMING SOON</div>
      </div>
    );
  }

  renderTemplates() {
    const templates = this.props.templates.map((template) => {
      return <Template
              key={template.name}
              name={template.name}
              thumbnail_url={template.thumbnail_url}
              onClick={this.handleClick} />
    });

    return (
      <div className="themes" data-category={this.props.name}>
        {templates}
      </div>
    );
  }

  render() {

    return (
      <div className='themes-wrapper'>
        {this.renderContent()}
      </div>
    );
  }
}
