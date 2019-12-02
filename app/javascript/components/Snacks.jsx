import React from "react"
import PropTypes from "prop-types"
import clsx from 'clsx'
import { makeStyles } from '@material-ui/core/styles'
import Snackbar from '@material-ui/core/Snackbar'
import IconButton from '@material-ui/core/IconButton'
import InfoIcon from '@material-ui/icons/Info'
import CloseIcon from '@material-ui/icons/Close'
import WarningIcon from '@material-ui/icons/Warning'
import ErrorIcon from '@material-ui/icons/Error'
import CheckCircleIcon from '@material-ui/icons/CheckCircle'
import { amber, green } from '@material-ui/core/colors'

const useStyles = makeStyles(theme => ({
  success: {
    backgroundColor: green[600],
  },
  error: {
    backgroundColor: theme.palette.error.dark,
  },
  info: {
    backgroundColor: theme.palette.primary.main,
  },
  warning: {
    backgroundColor: amber[700],
  },
  icon: {
    fontSize: 20,
  },
  iconVariant: {
    opacity: 0.9,
    marginRight: theme.spacing(1),
  },
  message: {
    display: 'flex',
    alignItems: 'center',
  },
}))

const variantIcon = {
  success: CheckCircleIcon,
  warning: WarningIcon,
  error: ErrorIcon,
  info: InfoIcon,
}

class Snacks extends React.Component {
  state = {
    open: this.props.messages.length > 0
  }
  handleClose = (event, reason) => {
    if (reason === 'clickaway') { return }
    this.setState({open: false})
  }

  render() {
    const {open} = this.state
    const { className, messages, onClose, variant, ...other } = this.props

    const FlashBar = () => {
      const classes = useStyles()
      const Icon = variantIcon[variant]
      return (
        <React.Fragment>
          <Snackbar
            anchorOrigin={{ vertical: 'top', horizontal: 'center', }}
            // className={clsx(classes[variant], className)}
            open={open}
            autoHideDuration={2500}
            onClose={this.handleClose}
            ContentProps={{ 'aria-describedby': 'message-id', }}
            message={
              <span id="client-snackbar" className={classes.message}>
                <Icon className={clsx(classes.icon, classes.iconVariant)} />
                {messages.join('. ')}
              </span>
            }
            action={[
              <IconButton key="close" aria-label="close" color="inherit" className={classes.close} onClick={this.handleClose}>
                <CloseIcon className={classes.icon} />
              </IconButton>,
            ]}
          />
        </React.Fragment>
      )
    }

    return (
      <FlashBar/>
    )
  }
}

export default Snacks
