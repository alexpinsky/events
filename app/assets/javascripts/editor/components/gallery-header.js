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
        <a className="prev" onClick={this.handlePrevClick}>{'<'}</a>
        <div className='category-name'>{this.props.categoryName}</div>
        <a href="#" className="next" onClick={this.handleNextClick}>{'>'}</a>
      </div>
    );
  }
}
