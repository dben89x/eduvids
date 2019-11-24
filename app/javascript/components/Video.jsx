import React from "react"
import PropTypes from "prop-types"
class Video extends React.Component {
  render () {
    return (
      <React.Fragment>
        <h2 className="header">Video name</h2>
        <p className="grey-text text-darken-3 lighten-3">This is overview text. {this.props.description}</p>
        <div className="video-container">
          {/* <div itemscope itemtype="https://schema.org/VideoObject"><meta itemprop="uploadDate" content="2019-07-11T17:50:36"/><meta itemprop="name" content="Yspn Allycarda First Base Defense Pt2 Fielding Bunts With Putouts"/><meta itemprop="duration" content="PT1M43S" /><meta itemprop="thumbnailUrl" content="https://content.jwplatform.com/thumbs/HDvoHDiV-1920.jpg"/><meta itemprop="contentUrl" content="https://content.jwplatform.com/videos/HDvoHDiV-TlqPiHRv.mp4"/><div style="position:relative; overflow:hidden; padding-bottom:56.25%">
          </div></div> */}
          <iframe src="https://cdn.jwplayer.com/players/HDvoHDiV-a7o1Fkg4.html" width="100%" height="100%" frameBorder="0" scrolling="auto" title="Yspn Allycarda First Base Defense Pt2 Fielding Bunts With Putouts" style={{position: 'absolute'}} allowFullScreen></iframe>
        </div>
      </React.Fragment>
    );
  }
}

export default Video
