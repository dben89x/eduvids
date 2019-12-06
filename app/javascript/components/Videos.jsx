import React from "react"
import PropTypes from "prop-types"
import Video from './Video'
import axios from 'axios'
import CircularProgress from '@material-ui/core/CircularProgress'

class Videos extends React.Component {
  constructor(props) {
    super(props)
    // var videos = this.fetchVideos()
    this.state = {
      selectedVideo: this.props.videos[0],
      currentQuizAttempt: undefined,
      currentQuestion: undefined,
      selectedAnswer: undefined,
      isLoading: false,
      currentQuizComplete: false,
      completedVideos: []
    }
  }

  fetchQuiz = () => {
    this.setState({isLoading: true})
    axios({
      method: 'get',
      url: `/quiz_attempts/current`,
      params: {
        video_id: this.state.selectedVideo.id,
      }
    }).then( response => {
      this.handleQAResponse(response)
    }).catch( e => {
      console.log(e)
    }).finally( () => {
      this.setState({isLoading: false})
    })
  }

  // fetchVideos = () => {
  //   axios({
  //     method: 'get',
  //     url: `/videos`,
  //     params: {
  //       video_id: this.state.selectedVideo.id,
  //     },
  //     dataType: 'json'
  //   }).then( response => {
  //     this.handleQAResponse(response)
  //   }).catch( e => {
  //     console.log(e)
  //   }).finally( () => {
  //     this.setState({isLoading: false})
  //   })
  // }

  componentDidMount() {
    this.fetchQuiz()
  }

  changeVideo = (e, selectedVideo) => {
    var {completedVideos} = this.state
    completedVideos.push(selectedVideo.id)
    e && e.preventDefault()
    this.setState({selectedVideo, completedVideos}, () => {
      this.fetchQuiz()
    })
  }

  capitalize = (string) => {
    return string.charAt(0).toUpperCase() + string.slice(1)
  }

  submitAnswer = e => {
    e.preventDefault()
    var {currentQuizAttempt, currentQuestion, selectedAnswer} = this.state
    this.setState({isLoading: true, selectedAnswer: undefined})
    axios({
      method: 'post',
      url: `/question_answers`,
      data: {
        answer_id: selectedAnswer,
        quiz_attempt_id: currentQuizAttempt.id,
      }
    }).then( response => {
      this.handleQAResponse(response)
    }).catch( e => {
      console.log(e)
    }).finally( () => {
      this.setState({isLoading: false})
    })
  }

  handleQAResponse = (response) => {
    var currentQuizAttempt = response.data
    this.setState({currentQuizAttempt, currentQuestion: currentQuizAttempt.random_question})
    if (currentQuizAttempt.complete && !currentQuizAttempt.next_attempt) {
      window.location = '/results'
    }
  }

  newQuiz = () => {
    const {currentQuizAttempt} = this.state
    this.setState({currentQuizAttempt: null}, () => {
      this.changeVideo(null, currentQuizAttempt.next_attempt)
    })
  }

  render () {
    const {videos, chapters} = this.props
    const {selectedVideo, currentQuizAttempt, selectedAnswer, isLoading, currentQuestion, completedVideos} = this.state

    const CurrentQuizAttempt = () => {
      return (<React.Fragment>
        {currentQuizAttempt.complete ? (
          <React.Fragment>
            <hgroup className="header" style={{textAlign: 'center'}}>
              <h4 className="header">Congratulations!</h4>
              <h6>You've completed this quiz. Time to move onto the next one.</h6>
              <div className="button-container" style={{display: 'flex', justifyContent: 'center', margin: '2rem 0 8rem'}}>
                <button className="waves-effect waves-light btn black" onClick={this.newQuiz}>
                  Next Lesson
                </button>
              </div>
            </hgroup>
          </React.Fragment>
        ) : (
          <React.Fragment>
            <hgroup className="header">
              <h4 className="header">Quiz</h4>
              <h6>{currentQuizAttempt.question_tracker}</h6>
            </hgroup>
            {currentQuestion ? (
              <form onSubmit={e => this.submitAnswer(e)}>
                <div key={currentQuestion.id} className="question">{currentQuestion.body}</div>
                {currentQuestion.random_answers.map( (answer) => (
                  <p key={answer.id}>
                    <label className='black-text'>
                      <input className='with-gap' checked={selectedAnswer === answer.id} name={`answer_${answer.id}`} type="radio" value={`answer_${answer.id}`} onChange={e => this.setState({selectedAnswer: answer.id})}/>
                      <span>{this.capitalize(answer.body)}</span>
                    </label>
                  </p>
                ))}
                <div className="button-container" style={{display: 'flex', justifyContent: 'flex-end'}}>
                  <button className="waves-effect waves-light btn black" type="submit" disabled={typeof selectedAnswer === 'undefined'}>
                    {currentQuizAttempt.remaining_question_count > 1 ? 'Next Question' : 'Complete Quiz'}
                  </button>
                </div>
              </form>
            ) : null}
          </React.Fragment>
        )}
      </React.Fragment>)
    }

    return (
      <React.Fragment>
        <div className="row s12 nopad">
          <div className="col s3 collection videos-wrapper nopad">
            {videos.map( video => (
              <a href="" key={video.id}
                className={`collection-item black-text ${selectedVideo.id == video.id ? 'grey lighten-2' : ((video.complete || completedVideos.includes(video.id)) ? 'blue-grey lighten-5' : '')}`}
                onClick={e => this.changeVideo(e, video)}
                >
                {video.title}
              </a>
            ))}
          </div>
          <div className="col s9 video-wrapper nopad">
            <Video video={selectedVideo}/>
            <div className="container">
              <h4 className="header">{selectedVideo.title}</h4>

              <div className="quiz-container" style={{margin: '4rem 0'}}>
                {isLoading ? (
                  <div className="loader-wrapper">
                    <CircularProgress />
                  </div>
                ) : null}
                {currentQuizAttempt ? <CurrentQuizAttempt/> : null}
              </div>
            </div>
          </div>
        </div>
      </React.Fragment>
    )
  }
}

export default Videos
