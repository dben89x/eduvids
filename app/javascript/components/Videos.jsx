import React from "react"
import PropTypes from "prop-types"
import Video from './Video'

class Videos extends React.Component {

  state = {
    selectedVideo: this.props.videos[0],
    currentQuiz: this.props.videos[0].quizzes[0],
  }

  changeVideo = (selectedVideo) => {
    this.setState({selectedVideo}, () => {
      this.setState({currentQuiz: selectedVideo.quizzes[0]})
    })
  }

  capitalize = (string) => {
    return string.charAt(0).toUpperCase() + string.slice(1);
  }

  render () {
    const {videos} = this.props
    const {selectedVideo, currentQuiz} = this.state

    return (
      <React.Fragment>
        <div className="row s12 nopad">
          <div className="col s3 collection videos-wrapper nopad">
            {videos.map( video => (
              <a href="" key={video.id} className="collection-item" onClick={() => this.changeVideo(video)}>
                {video.title}
              </a>
            ))}
          </div>
          <div className="col s9 video-wrapper nopad">
            <Video video={selectedVideo}/>
            <div className="container">
              {/* <div className="btn-container center-align" style={{padding: '1rem'}}>
                <button className="btn waves-effect waves-light blue-grey darken-1">Take Quiz</button>
              </div> */}
              <h2 className="header">Quiz</h2>
              <form onSubmit={this.submitQuiz}>
                {currentQuiz.random_questions.map( (question, i) => (
                  <React.Fragment>
                    <div key={question.id} className="question">{question.body}</div>
                    {question.random_answers.map( (answer) => (
                      <p key={answer.id}>
                        <label>
                          <input checked={currentQuiz.random_questions[i]} name={`answer_${answer.id}`} type="radio" value={`answer_${answer.id}`}/>
                          <span>{this.capitalize(answer.body)}</span>
                        </label>
                      </p>
                    ))}
                  </React.Fragment>
                ))}
              </form>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default Videos
