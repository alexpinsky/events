import React, { Component } from 'react';

export default class GalleryHeader extends Component {
  constructor(props) {
    super(props);

    this.handleNextClick = this.handleNextClick.bind(this);
    this.handlePrevClick = this.handlePrevClick.bind(this);
  }

  handlePrevClick() {
    this.props.onPrevClick();
  }

  handleNextClick() {
    this.props.onNextClick();
  }

  render() {

    return (
      <div className='gallery-header'>
        <div className="prev" onClick={this.handlePrevClick}>{'<'}</div>
        <div className='category-name'>{this.props.categoryName.toUpperCase()}</div>
        <div className="next" onClick={this.handleNextClick}>{'>'}</div>
      </div>
    );
  }
}
