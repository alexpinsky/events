import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { BackgroundTypes } from '../../../enums';
import ImageTile from '../components/image-tile';
import ColorTile from '../components/color-tile';

import { setBackground } from '../actions/appearance-actions';

export default class BackgroundTiles extends Component {

  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(newBackground) {
    this.props.setBackground(newBackground);
  }

  renderTiles() {

    return (
      this.props.tiles.map((tile) => {

        if (tile.type == BackgroundTypes.image) {
          return <ImageTile key={tile.url} tile={tile} onClick={this.handleClick} />;
        }
        else {
          return <ColorTile key={tile.color} tile={tile} onClick={this.handleClick} />;
        }
      })
    );
  }

  render() {

    return (
      <div>
        <div className='background-tagline'>
          <div className='background-icon'></div>
          <div className='background-text'>choose your favorite background</div>
        </div>
        <div className='background-tiles'>
          {this.renderTiles()}
        </div>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ setBackground }, dispatch);
}

export default connect(null, mapDispatchToProps)(BackgroundTiles);

BackgroundTiles.defaultProps = {
  tiles: [
    {
      type: BackgroundTypes.color,
      color: "white"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451684700/diagonal_striped_brick_fruxru.png",
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451684809/swirl_pattern_dj7qd6.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225524/p25_rgtlt6.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683818/P_Stripes_b_m5owjb.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225524/p24_stnvvf.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225524/p22_dpadmb.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225524/p23_sfbdts.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225523/p21_pjttby.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225523/p20_fp8mr2.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683819/P_Stripes_p_vde1oz.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225523/p16_yarkim.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225523/p17_zmnzao.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225523/p15_eguuoa.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225523/p14_v3gcsw.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225523/p10_bxsyio.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225523/p9_boxqe6.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225522/p13_hwbxqg.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225522/p12_fjuole.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225522/p11_s8d7o9.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225522/p8_o3deem.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225522/p7_qty5th.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225522/p3_ge2q0i.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225522/p4_m3axsy.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225522/p5_snf5mu.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225522/p6_fcu9qx.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225522/p2_x6k0na.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463225521/p1_wfxkf9.png"
    }
  ]
}
