var Pictures = React.createClass({
  propTypes: {
    pictures: React.PropTypes.object.isRequired,
    addPicture: React.PropTypes.func.isRequired,
    removePicture: React.PropTypes.func.isRequired
  },

  componentWillMount() {
    console.log('componentWillMount')
    this.init();
  },

  componentWillUnmount() {
    console.log('componentWillUnmount')
    this._pictureService = null;
  },

  init() {
    this._pictureService = new PictureService;
  },

  handleAddPicture(args) {
    this._pictureService.upload()
    .then(function(url) {
      console.log(url);
      console.log(this.props);
      // this.props.addPicture({order: args.order, url: url});
      // return url;
    },
    function (data) {
      console.log('progress')
        // $('.progress_bar').css('width', Math.round((data.loaded * 100.0) / data.total) + '%');
    });

    // Q(this._pictureService.upload())
    // .then(function(url) {
    //   this.props.addPicture({order: args.order, url: url});
    //   return url;
    // }.bind(this));
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
