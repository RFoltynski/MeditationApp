import React, { Component } from "react";
import ReactDOM from "react-dom";
import axios from "axios";
import ReactAudioPlayer from "react-audio-player";

class MeditationPlay extends Component {
  state = {
    isLoading: false
  };

  componentWillMount() {
    const currentHref = window.location.href.split("/");
    const id = currentHref[currentHref.length - 1];

    axios
      .get(
        `http://localhost:3000/api/v1/meditations/${id}`,
        {},
        { "Content-Type": "application/json" }
      )
      .then(res => {
        this.setState({
          intentions: res.data.data,
          isLoading: true
        });
      });
  }

  render() {
    let audio = this.state.isLoading
      ? this.state.intentions.meditationFile
      : "";
    return (
      <div>
        <div>
          <ReactAudioPlayer src={audio} controls />
        </div>
      </div>
    );
  }
}
export default ReactDOM.render(
  <MeditationPlay />,
  document.getElementById("play-page")
);
