import React from "react"
import PropTypes from "prop-types"
import Video from './Video'

class VidQuiz extends React.Component {
  render () {
    const {video} = this.props

    return (
      <React.Fragment style={{width: '100%'}}>
        <div className="parallax-container">
          <div className="parallax">
            <img src="https://materializecss.com/images/parallax1.jpg" style={{filter: 'blur(4px) brightness(0.3)', transform: 'scale(1.1)'}}/>

            <div className="row center-align" style={{position: 'absolute', width: '100%', height: '100%', display: 'flex', justifyContent: 'center', alignItems: 'center'}}>
              <div className="col" style={{width: '75%'}}>
                <h2 className="white-text">How To Do This Thing</h2>
                <br/>
                <p className="white-text row s6 offset-s3">Remember that thing we talked about earlier? Well, it's all covered here. If you're looking to do this thing, continue reading, because we'll cover that one thing we talked about, and then probably even more stuff.</p>
                <button className="btn waves-effect blue-grey darken-2 waves-light white-text">Continue reading</button>
              </div>
            </div>
          </div>
        </div>
        <div className="section white">

          <div className="row container">
            <Video description={video.description}/>
            <div className="container center-align" style={{padding: '1rem'}}>
              <a href={`/quizzes/${video.quizzes[0].id}`} className="btn waves-effect blue-grey darken-2 waves-light white-text">Take Quiz</a>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default VidQuiz
