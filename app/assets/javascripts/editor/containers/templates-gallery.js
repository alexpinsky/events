import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchCategories } from '../actions/categories-actions';
import GalleryHeader from '../components/gallery-header';
import TemplateList from '../components/template-list';

export class TemplatesGallery extends Component {
  constructor(props) {
    super(props);

    this.state = { currentCategory: '' };

    this.handleSlideChange = this.handleSlideChange.bind(this);
    this.handleNextClick   = this.handleNextClick.bind(this);
    this.handlePrevClick   = this.handlePrevClick.bind(this);
    this.handleTemplateClick  = this.handleTemplateClick.bind(this);
  }

  componentWillMount() {
    this.props.fetchCategories();
  }

  componentDidMount() {
    this.slider.on('init', () => {
      $(this.slider).css('visibility', 'visible');
    });

    this.slider.slick({ arrows: false });
    this.slider.show();

    this.slider.on('beforeChange', this.handleSlideChange);
  }

  componentWillReceiveProps(nextProps) {
    this.setState({ currentCategory: nextProps.categories[0].name });
  }

  handleTemplateClick(template) {
    console.log('template.name', template.name);
  }

  handleNextClick() {
    this.slider.slick('slickPrev');
  }

  handlePrevClick() {
    this.slider.slick('slickNext');
  }

  handleSlideChange(e, slick, currentIndex, nextIndex) {
    const nextSlide = $(slick.$slides.get(nextIndex));
    const nextCategory = nextSlide.children().first().data('category');

    this.setState({ currentCategory: nextCategory });
  }

  renderTemplateLists() {
    return this.props.categories.map((category) => {
      return <TemplateList
              key={category.name}
              name={category.name}
              templates={category.templates}
              onTemplateClick={this.handleTemplateClick} />
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
          {this.renderTemplateLists()}
        </div>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchCategories }, dispatch);
}

function mapStateToProps(state) {
  return { categories: state.categories };
}

export default connect(mapStateToProps, mapDispatchToProps)(TemplatesGallery);
