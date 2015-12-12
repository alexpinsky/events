var Pictures = React.createClass({
  propTypes: {
    pictures: React.PropTypes.object.isRequired,
    addPicture: React.PropTypes.func.isRequired,
    removePicture: React.PropTypes.func.isRequired
  },

  componentWillUnmount() {
  },

  handleAddPicture(args) {
    var url = 'https://events-assets-users.s3.amazonaws.com/uploads/development/picture/image/27/image_2.jpg';
    this.props.addPicture({order: args.order, url: url});
    return url;
  },

  handleRemovePicture(args) {
    this.props.removePicture({order: args.order});
  },

  render() {
    var picturesSize = Object.keys(this.props.pictures).length;
    var pictures = [];
    for(id in this.props.pictures) {
      picture = this.props.pictures[id]
      pictures.push(
        <Picture
          key={id}
          initialUrl={picture.url}
          order={picture.order}
          isLast={id == picturesSize}
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
      </div>
    )
  }
});
