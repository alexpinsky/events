import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { _ } from 'lodash';

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
    let pictures = [];

    _.times(NUM_OF_PICS, (index) => {
      index++;
      let picture = this.props.pictures[index]
      let url     = picture == undefined ? null : picture.url;

      pictures.push(
        <Picture
          key={index}
          index={index}
          url={url}
          isLast={index == NUM_OF_PICS}
          addPicture={this.handleAddPicture}
          removePicture={this.handleRemovePicture} />
      );
    });

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

const NUM_OF_PICS = 4;

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ addPicture, removePicture }, dispatch);
}

function mapStateToProps(state) {
  return { pictures: state.event.present.pictures };
}

export default connect(mapStateToProps, mapDispatchToProps)(Pictures);
