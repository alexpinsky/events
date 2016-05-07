import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import Picture from '../components/picture'
import ProgressBar from '../components/progress-bar'
import File from '../../../services/file';

import { addPicture, removePicture} from '../actions/picture-actions';

export default class Pictures extends Component {

  constructor(props) {
    super(props);

    this.handleAddPicture    = this.handleAddPicture.bind(this);
    this.handleRemovePicture = this.handleRemovePicture.bind(this);

    this.state = { progress: 0 };
  }

  handleAddPicture(args) {
    if (this.state.progress > 0)
      return false ;

    return File.upload().then(

      function(url) {
        // resolve
        this.props.addPicture(args.index, url);
      }.bind(this),

      function(data) {
        // reject
        console.log('pictures-error:');
        console.log(data);
      },

      function(data) {
        // progress
        let progress = Math.round((data.loaded * 100.0) / data.total);

        if (progress == 100) {
          setTimeout(function() {
            this.setState({ progress: 0 });
          }.bind(this), 3000);
        };

        this.setState({ progress: progress });
      }.bind(this));
  }

  handleRemovePicture(args) {
    this.props.removePicture(args.index);
  }

  render() {
    let picturesSize = Object.keys(this.props.pictures).length;
    let pictures = [];

    for(let index in this.props.pictures) {
      let picture = this.props.pictures[index]

      pictures.push(
        <Picture
          key={index}
          index={index}
          url={picture.url}
          isLast={index == picturesSize}
          addPicture={this.handleAddPicture}
          removePicture={this.handleRemovePicture} />
      );
    }

    return (
      <div>
        <div className='pics-tagline'>
          <div className='pics-icon' />
          <div className='pics-text'>upload up to 4 photos</div>
        </div>
        <div className='pics-tiles'>
          {pictures}
        </div>
        <ProgressBar progress={this.state.progress}/>
      </div>
    )
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ addPicture, removePicture }, dispatch);
}

function mapStateToProps(state) {
  return { pictures: state.event.present.pictures };
}

export default connect(mapStateToProps, mapDispatchToProps)(Pictures);
