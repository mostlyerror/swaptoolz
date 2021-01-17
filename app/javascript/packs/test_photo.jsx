import React from 'react'
import ReactDOM from 'react-dom'
import Camera from 'react-html5-camera-photo';
import 'react-html5-camera-photo/build/css/index.css';
// https://github.com/mabelanger/react-html5-camera-photo

const handleTakePhoto = (dataUri) => {
  console.log('takePhoto');
}

const TestPhoto = (props) => (
  <Camera
    onTakePhoto = { (dataUri) => { handleTakePhoto(dataUri); } }
  />
);

document.addEventListener('turbolinks:load', () => {
  ReactDOM.render(
    <TestPhoto />,
    document.getElementById('test-photo')
  )
})