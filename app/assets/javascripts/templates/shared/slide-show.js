import React, { Component } from 'react';
import { _ } from 'lodash';

export default class SlideShow extends Component {

  componentDidMount() {
    this.startSlide();
  }

  componentWillUpdate(nextProps, nextState) {
    this.stopSlide();
  }

  componentDidUpdate(prevProps, prevState) {
    this.startSlide();
  }

  componentWillUnmount() {
    this.stopSlide();
  }

  startSlide() {
    if(!this.shouldRunSlideShow())
      return;

    $(this.picturesContanier).slick({
      autoplay: true,
      arrows: false,
      mobileFirst: true,
      speed: 2000
    });
  }

  stopSlide() {
    if(this.shouldRunSlideShow())
      $(this.picturesContanier).slick('unslick');
  }

  shouldRunSlideShow() {
    return Object.keys(this.props.pictures).length > 1;
  }

  renderPictures() {
    return _.map(
      _.filter(
        this.props.pictures,
        (o) => o.url != null
      ),
      (pic, index) => <img key={index} src={pic.url} />
    );
  }

  render() {

    return (
      <div className='images' ref={(ref) => this.picturesContanier = ref}>
        {this.renderPictures()}
      </div>
    );
  }
}
