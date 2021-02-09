// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React, { useState } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

const MotelOptInForm = ({ handler }) => {
	return (
			<div>
				<h3>Is your motel participating in the SWAP Period?</h3>
				<button onClick={() => handler(true)}>Yes</button>
				<button onClick={() => handler(false)}>No</button>
			</div>
	)
}

// this really needs a confirmation, a way to "undo" within a time period, and some info to contact the swap operator if this changes
const MotelOptOut = () => <p>That's too bad!</p>

const MotelAvailabilityForm = () => {
	return (
		<form action="motel_availability" method="post">
			Enter the number of rooms available for the SWAP Period:
			<input name="rooms" type="number" />
			<input type="submit" value="Send"/>
		</form>
	)
}

const MotelParticipation = props => {
	const [ participation, setParticipation ] = useState('')

	if (participation === '') {
		return <MotelOptInForm handler={setParticipation} />
	}
        else if (participation === false) {
		return <MotelOptOut />
	}
	else {
		return <MotelAvailabilityForm />
	}
}

MotelParticipation.defaultProps = {
}

MotelParticipation.propTypes = {
}

document.addEventListener('turbolinks:load', () => {
	ReactDOM.render(
		<MotelParticipation />,
		document.getElementById('motel-participation-form')
	)
})
