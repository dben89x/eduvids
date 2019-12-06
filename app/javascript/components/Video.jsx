import React from "react"
import PropTypes from "prop-types"
class Video extends React.Component {

  shouldComponentUpdate(nextProps, nextState) {
    return this.props.video !== nextProps.video
  }

  render () {
    const {video} = this.props

    return (
      <React.Fragment>
        <div className="video-container">
          <iframe key={video.id} src={video.url} frameBorder="0" scrolling="auto" title={video.title} allowFullScreen></iframe>
        </div>
      </React.Fragment>
    );
  }
}

export default Video
