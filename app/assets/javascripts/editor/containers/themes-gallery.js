import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import GalleryHeader from '../components/gallery-header';
import ThemeList from '../components/theme-list';

export class ThemesGallery extends Component {
  constructor(props) {
    super(props);

    this.state = {};

    this.handleSlideChange = this.handleSlideChange.bind(this);
  }

  componentWillMount() {
    // this.props.fetchThemes();
  }

  componentDidMound() {
    this.slider.on('init', () => {
      $(this).css('visibility', 'visible');
    });

    this.slider.slick({ arrows: false });
    this.slider.show();

    this.slider.on('beforeChange', this.handleSlideChange);
  }

  shouldComponentUpdate(nextProps, nextState) {
    console.log('nextProps', nextProps);
  }

  componentWillReceiveProps(nextProps) {
    console.log('nextProps', nextProps);
    this.setState({ currentCategory: nextProps.categories[0].name });
  }

  handleSlideChange(e, slick, currentIndex, nextIndex) {
    const nextSlide = $(slick.$slides.get(nextIndex));
    const nextCategory = nextSlide.children().first().data('category');

    this.setState({ currentCategory: nextCategory });
  }

  renderThemeLists() {
    return this.props.categories.map((category) => {
      return <ThemeList key={category.name} name={category.name} themes={category.themes} />
    });
  }

  render() {

    return (
      <div className="gallery">
        <GalleryHeader
          categoryName={this.state.currentCategory}
          onPrevClick={this.handlePrevClick}
          onNextClick={this.handleNextClick} />
        <div className='slide' ref={(ref) => { this.slider = $(ref) }}>
          {this.renderThemeLists()}
        </div>
      </div>
    );
  }
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ updateText }, dispatch);
// }

function mapStateToProps(state) {
  return { categories: state.categories };
}

// export default connect(mapStateToProps, mapDispatchToProps)(TextEdit);
export default connect(mapStateToProps)(ThemesGallery);