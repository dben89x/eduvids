import React from "react"
import PropTypes from "prop-types"
import axios from 'axios'

class ProfileSetup extends React.Component {
  state = {
    selectedSports: this.props.selectedSports || [],
    ageLevel: this.props.ageLevel,
    selectedGenders: this.props.selectedGenders || [],
    yearsExperience: this.props.yearsExperience || '',
    previousTraining: this.props.previousTraining,
  }

  componentDidMount() {
    document.addEventListener('DOMContentLoaded', function() {
      var elems = document.querySelectorAll('select');
      var instances = M.FormSelect.init(elems, options);
    });
  }

  changeMultiple = (collection, selected) => {
    var collectionState = this.state[collection]
    if (collectionState.includes(selected)) {
      collectionState.splice( collectionState.indexOf(selected), 1 )
    } else {
      collectionState = this.state[collection].concat(selected)
    }
    this.setState({[collection]: collectionState})
  }

  onSubmit = e => {
    e.preventDefault()
    var {selectedSports, ageLevel, selectedGenders, yearsExperience, previousTraining} = this.state
    axios({
      method: 'put',
      url: `/profiles/${this.props.profile.id}`,
      data: {
        sports: selectedSports,
        age_level: ageLevel,
        genders: selectedGenders,
        years_experience: yearsExperience,
        previous_training: previousTraining,
      }
    }).then( response => {
      window.location = response.data.location
    }).catch( e => {
      console.log(e)
    })
  }

  render () {
    const {sports, ages, genders} = this.props
    const {selectedSports, selectedGenders, previousTraining, ageLevel, yearsExperience} = this.state


    return (
      <React.Fragment>
        <div className="s12 center">

          <h2 className="header flow-text">Profile Setup</h2>
          <form action="" onSubmit={this.onSubmit} style={{textAlign: 'left', display: 'flex', flexDirection: 'column'}}>
            <div className="col card s12 m6 offset-m3 blue-grey-text text-darken-2">
              <div className="card-content">
                <h6 className="header flow-text">Which sports do you coach?</h6>
                <div className="card-content">
                  {sports.map( sport => (
                    <p key={sport}>
                      <label>
                        <input type="checkbox" className="filled-in blue-grey" checked={selectedSports.includes(sport)} onChange={e => this.changeMultiple('selectedSports', sport)} />
                        <span>{sport}</span>
                      </label>
                    </p>
                  ))}
                </div>
              </div>
            </div>

            <div className="col card s12 m6 offset-m3 blue-grey-text text-darken-2">
              <div className="card-content">
                <h6 className="header flow-text">Which age level do you coach?</h6>
                <div className="card-content">
                  {ages.map( age => (
                    <p key={age.value}>
                      <label>
                        <input type="checkbox" className="filled-in blue-grey" checked={ageLevel === age.value} onChange={e => this.setState({ageLevel: age.value})} />
                        <span>{age.label}</span>
                      </label>
                    </p>
                  ))}
                </div>
              </div>
            </div>

            <div className="col card s12 m6 offset-m3 blue-grey-text text-darken-2">
              <div className="card-content">
                <h6 className="header flow-text">Which gender(s) do you coach?</h6>
                <div className="card-content">
                  {genders.map( gender => (
                    <p key={gender}>
                      <label>
                        <input type="checkbox" className="filled-in blue-grey" checked={selectedGenders.includes(gender)} onChange={e => this.changeMultiple('selectedGenders', gender)} />
                        <span>{gender}</span>
                      </label>
                    </p>
                  ))}
                </div>
              </div>
            </div>

            <div className="col card s12 m6 offset-m3 blue-grey-text text-darken-2">
              <div className="card-content">
                <h6 className="header flow-text">How many years have you been coaching?</h6>
                <div className="card-content">
                  <div className="input-field">
                    <select className="blue-grey-text" onChange={e => this.setState({yearsExperience: e.target.value})} value={yearsExperience}>
                      <option className="blue-grey-text" value="" >Choose your option</option>
                      <option className="blue-grey-text" value={0}>Under 1 Year</option>
                      <option className="blue-grey-text" value={1}>1 Year</option>
                      {Array(49).fill('').map( (e, i) => (
                        <option key={`${e}${i}`} value={i+2}>{`${i+2} Years`}</option>
                      ))}
                    </select>
                  </div>
                </div>
              </div>
            </div>

            <div className="col card s12 m6 offset-m3 blue-grey-text text-darken-2">
              <div className="card-content">
                <h6 className="header flow-text">Have you had any previous Concussion Training?</h6>
                <div className="card-content">
                  <p>
                    <label>
                      <input type="checkbox" className="filled-in blue-grey" checked={previousTraining == true} onChange={e => this.setState({previousTraining: true})} />
                      <span>Yes</span>
                    </label>
                  </p>
                  <p>
                    <label>
                      <input type="checkbox" className="filled-in blue-grey" checked={previousTraining == false} onChange={e => this.setState({previousTraining: false})} />
                      <span>No</span>
                    </label>
                  </p>
                </div>
              </div>
            </div>

            <div className="btn-container col s12 m6 offset-m3 blue-grey-text text-darken-2" style={{padding: 0}}>
              <button type="submit" className="waves-effect blue-grey waves-light btn-large" style={{width: '100%'}}>Save information</button>
            </div>
          </form>
        </div>

      </React.Fragment>
    );
  }
}

export default ProfileSetup
